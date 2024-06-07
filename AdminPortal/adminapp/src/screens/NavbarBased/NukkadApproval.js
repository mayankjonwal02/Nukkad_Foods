import React, { useEffect, useState } from 'react';
import config from '../../config';
import './Restaurants.css'; // Import your custom CSS file for styling

export default function NukkadApproval() {
    const [nukkadList, setNukkadList] = useState([]);
    const [filteredNukkadList, setFilteredNukkadList] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchField, setSearchField] = useState('nukkadName');
    const { API_URL } = config;

    useEffect(() => {
        fetch(`${API_URL}/api/auth/fetchAllRestaurants`)
            .then(res => res.json())
            .then(data => {
                const unverifiedNukkads = data.restaurants.filter(nukkad => nukkad.status === 'unverified');
                setNukkadList(unverifiedNukkads);
                setFilteredNukkadList(unverifiedNukkads);
                setLoading(false);
            })
            .catch(error => {
                console.error("Error fetching unverified nukkads:", error);
                setLoading(false);
            });
    }, []);

    useEffect(() => {
        // Filter nukkad list based on search term and field
        const filtered = nukkadList.filter(nukkad =>
            nukkad[searchField].toLowerCase().includes(searchTerm.toLowerCase())
        );
        setFilteredNukkadList(filtered);
    }, [searchTerm, searchField, nukkadList]);

    const handleVerifyNukkad = (id) => {
        
        try {
            
            fetch(`${API_URL}/api/auth/updateRestaurantById`,
                {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ _id: id, updateData: { status: 'verified' } }),
                }
            ).then(res => res.json()).then(data => {
                if (data.executed) {
                    alert('Nukkad verified successfully');
                    setLoading(true);
                    fetch(`${API_URL}/api/auth/fetchAllRestaurants`)
                    .then(res => res.json())
                    .then(data => {
                        const unverifiedNukkads = data.restaurants.filter(nukkad => nukkad.status === 'unverified');
                        setNukkadList(unverifiedNukkads);
                        setFilteredNukkadList(unverifiedNukkads);
                        setLoading(false);
                    })
                    .catch(error => {
                        console.error("Error fetching unverified nukkads:", error);
                        setLoading(false);
                    });
                } else {
                    alert('Failed to verify nukkad');
                }
            }   

            )
        } catch (error) {
            alert('Failed to verify nukkad', error);
        }
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
            <h1 className='m-5 fw-bold'>Nukkad Approval</h1>
            <div className="input-group mb-3 me-4" style={{ width: "50%" }}>
                <select className="form-select me-5" value={searchField} onChange={(e) => setSearchField(e.target.value)}>
                    <option value="nukkadName">Nukkad Name</option>
                    <option value="nukkadAddress">Nukkad Address</option>
                    <option value="city">City</option>
                    <option value="pincode">Pincode</option>
                    <option value="ownerName">Owner Name</option>
                    <option value="ownerEmail">Owner Email</option>
                    <option value="currentAddress">Current Address</option>
                    <option value="permananetAddress">Permanent Address</option>
                </select>
                <input
                    type="text"
                    placeholder={`Search by ${searchField}...`}
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    className="form-control"
                    style={{ width: "50%" }}
                />
            </div>
            <table className="table smaller-font">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nukkad Name</th>
                        <th scope="col">Nukkad Address</th>
                        <th scope="col">City</th>
                        <th scope="col">Pincode</th>
                        <th scope="col">Owner Name</th>
                        <th scope="col">Owner Email</th>
                        <th scope="col">Current Address</th>
                        <th scope="col">Permanent Address</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {filteredNukkadList.map(nukkad => (
                        <tr key={nukkad._id}>
                            <td>{nukkad._id}</td>
                            <td>{nukkad.nukkadName}</td>
                            <td>{nukkad.nukkadAddress}</td>
                            <td>{nukkad.city}</td>
                            <td>{nukkad.pincode}</td>
                            <td>{nukkad.ownerName}</td>
                            <td>{nukkad.ownerEmail}</td>
                            <td>{nukkad.currentAddress}</td>
                            <td>{nukkad.permananetAddress}</td>
                            <td>
                                <button onClick={() => handleVerifyNukkad(nukkad._id)} className="btn btn-primary">Verify</button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
