import React, { useEffect, useState } from 'react';
import config from '../../config';
import './Restaurants.css'; // Import your custom CSS file for styling

export default function ShowSubAdmins() {
    const [subAdmins, setSubAdmins] = useState([]);
    const [filteredSubAdmins, setFilteredSubAdmins] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchField, setSearchField] = useState('UniqueId'); // Default search field
    const { API_URL } = config;

    useEffect(() => {
        const managerId = localStorage.getItem('admin'); // Fetch managerId from localStorage
        fetch(`${API_URL}/api/subadmin/getSubAdmin`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ managerId }) // Send managerId in the request body
        })
        .then(res => res.json())
        .then(data => {
            if (data.length > 0) { setSubAdmins(data); }
            setLoading(false);
        })
        .catch(error => {
            console.error("Error fetching sub-admins:", error);
            setLoading(false);
        });
    }, []);

    useEffect(() => {
        // Filter sub-admins based on search term and field
        if (subAdmins.length > 0) {
            const filtered = subAdmins.filter(subAdmin =>
                subAdmin[searchField].toLowerCase().includes(searchTerm.toLowerCase())
            );
            setFilteredSubAdmins(filtered);
        }
    }, [searchTerm, searchField, subAdmins]);

    const handleSearchTermChange = event => {
        setSearchTerm(event.target.value);
    };

    const handleSearchFieldChange = event => {
        setSearchField(event.target.value);
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
            <h1 className='m-5 fw-bold'>SubAdmins</h1>
            <div className="input-group mb-3 me-4" style={{ width: "50%" }}>
                <select className="form-select me-5" value={searchField} onChange={handleSearchFieldChange}>
                    <option value="managerId">Manager ID</option>
                    <option value="UniqueId">Unique ID</option>
                </select>

                <input
                    type="text"
                    placeholder={`Search by ${searchField}...`}
                    value={searchTerm}
                    onChange={handleSearchTermChange}
                    className="form-control"
                    style={{ width: "50%" }}
                />
            </div>
            <table className="table smaller-font"> {/* Added the 'smaller-font' class */}
                <thead>
                    <tr>
                        <th scope="col">Manager ID</th>
                        <th scope="col">Unique ID</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {filteredSubAdmins.map(subAdmin => (
                        <tr key={subAdmin._id}>
                            <td>{subAdmin.managerId}</td>
                            <td>{subAdmin.UniqueId}</td>
                            <td>
                                <button className="btn-secondary p-2 ps-4 pe-4">Edit</button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
