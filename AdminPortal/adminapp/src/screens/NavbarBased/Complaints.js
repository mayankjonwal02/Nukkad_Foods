import React, { useEffect, useState } from 'react';
import config from '../../config';
import './Restaurants.css'; // Import your custom CSS file for styling

export default function Complaints() {
    const [complaints, setComplaints] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [filterStatus, setFilterStatus] = useState(''); // Default filter status
    const { API_URL } = config;

    useEffect(() => {
        fetch(`${API_URL}/api/complaint/getAllComplaints`)
            .then(res => res.json())
            .then(data => {
                setComplaints(data.complaints);
                setLoading(false);
            })
            .catch(error => {
                console.error("Error fetching complaints:", error);
                setLoading(false);
            });
    }, []);

    const handleSearchTermChange = event => {
        setSearchTerm(event.target.value);
    };

    const handleFilterStatusChange = event => {
        setFilterStatus(event.target.value);
    };

    const filteredComplaints = complaints.filter(complaint =>
        
        complaint.complaints.some(c =>
            c.status.toLowerCase().includes(filterStatus.toLowerCase())
        ) &&
        (complaint.complaints.some(c =>
            c.complaintByID.toLowerCase().includes(searchTerm.toLowerCase())
        ) ||
        complaint.complaints.some(c =>
            c.description.toLowerCase().includes(searchTerm.toLowerCase())
        ))
    );

    const handleAnswerComplaint = (complaintID) => {
        // Logic to handle answering a complaint with the given ID
    };

    if (loading) {
        return (
            <div className='d-flex flex-column bg-white' style={{ minHeight: "100vh", maxWidth: "100vw", justifyContent: "center", alignItems: "center" }}>
                <div className="spinner-grow text-success" role="status">
                    <span className="visually-hidden">Loading...</span>
                </div>
            </div>
        );
    }

    return (
        <div className='d-flex flex-column bg-white' style={{ minHeight: "100vh", maxWidth: "100vw", justifyContent: "flex-start", alignItems: "center" }}>
            <h1 className='m-5 fw-bold'>Complaints</h1>
            <div className="d-flex justify-content-between align-items-center m-3">
                <input
                    type="text"
                    placeholder="Search by Status, ComplaintByID or Description..."
                    value={searchTerm}
                    onChange={handleSearchTermChange}
                    className="form-control me-3"
                    style={{ width: "40vw" }}
                />
                <select
                    className="form-select"
                    value={filterStatus}
                    onChange={handleFilterStatusChange}
                    style={{ width: "10vw" }}
                >
                    <option value="">All Statuses</option>
                    <option value="Pending">Pending</option>
                    <option value="Resolved">Resolved</option>
                </select>
            </div>
            <table className="table smaller-font">
                <thead>
                    <tr>
                        <th scope="col">Restaurant ID</th>
                        <th scope="col">Status</th>
                        <th scope="col">Order ID</th>
                        <th scope="col">Description</th>
                        <th scope="col">Complaint By ID</th>
                        <th scope="col">Designation</th>
                        <th scope="col">Created At</th>
                        <th scope="col">Updated At</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {filteredComplaints.map(complaintData => (
                        complaintData.complaints.map(complaint => (
                            <tr key={complaint._id}>
                                <td>{complaintData.restaurantID}</td>
                                <td>{complaint.status}</td>
                                <td>{complaint.orderID}</td>
                                <td>{complaint.description}</td>
                                <td>{complaint.complaintByID}</td>
                                <td>{complaint.designation}</td>
                                <td>{new Date(complaint.createdAt).toLocaleString()}</td>
                                <td>{new Date(complaint.updatedAt).toLocaleString()}</td>
                                <td>
                                    <button onClick={() => handleAnswerComplaint(complaint._id)} className="btn btn-primary">Answer</button>
                                </td>
                            </tr>
                        ))
                    ))}
                </tbody>
            </table>
        </div>
    );
}
