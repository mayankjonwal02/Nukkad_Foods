import React, { useEffect, useState } from 'react';
import config from '../../config';
import './Restaurants.css'; // Import your custom CSS file for styling

export default function Restaurants() {
    const [restaurants, setRestaurants] = useState([]);
    const [filteredRestaurants, setFilteredRestaurants] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchField, setSearchField] = useState('nukkadName'); // Default search field
    const [statusFilter, setStatusFilter] = useState('all'); // Default status filter
    const { API_URL } = config;

    useEffect(() => {
        fetch(`${API_URL}/api/auth/fetchAllRestaurants`)
            .then(res => res.json())
            .then(data => {
                setRestaurants(data.restaurants || []);
                setFilteredRestaurants(data.restaurants  || []); // Initialize filtered list with all restaurants
                setLoading(false);
            })
            .catch(error => {
                console.error("Error fetching restaurants:", error);
                setLoading(false);
            });
    }, [API_URL]);

    useEffect(() => {
        // Filter restaurants based on search term, search field, and status filter
        const filtered = restaurants.filter(restaurant =>
            restaurant[searchField]?.toLowerCase().includes(searchTerm.toLowerCase()) &&
            (statusFilter === 'all' || restaurant.status === statusFilter)
        );
        setFilteredRestaurants(filtered);
    }, [searchTerm, searchField, statusFilter, restaurants]);

    const handleSearchTermChange = event => {
        setSearchTerm(event.target.value);
    };

    const handleSearchFieldChange = event => {
        setSearchField(event.target.value);
    };

    const handleStatusFilterChange = status => {
        setStatusFilter(status);
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
            <h1 className='m-5 fw-bold'>Restaurants</h1>
            <div className="input-group mb-3 me-4" style={{ width: "50%" }}>
                <select className="form-select me-5" value={searchField} onChange={handleSearchFieldChange}>
                    <option value="nukkadName">Name</option>
                    <option value="city">City</option>
                    <option value="pincode">Pincode</option>
                    <option value="landmark">Landmark</option>
                    <option value="ownerName">Owner Name</option>
                    <option value="phoneNumber">Phone Number</option>
                    <option value="status">Status</option>
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
            <div className="mb-3">
                <button 
                    className={`btn btn-${statusFilter === 'all' ? 'primary' : 'secondary'} me-2`} 
                    onClick={() => handleStatusFilterChange('all')}>
                    All
                </button>
                <button 
                    className={`btn btn-${statusFilter === 'verified' ? 'primary' : 'secondary'} me-2`} 
                    onClick={() => handleStatusFilterChange('verified')}>
                    Verified
                </button>
                <button 
                    className={`btn btn-${statusFilter === 'unverified' ? 'primary' : 'secondary'}`} 
                    onClick={() => handleStatusFilterChange('unverified')}>
                    Unverified
                </button>
            </div>
            <table className="table smaller-font">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Address</th>
                        <th scope="col">City</th>
                        <th scope="col">Pincode</th>
                        <th scope="col">Landmark</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Owner</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    {filteredRestaurants.map(restaurant => (
                        <tr key={restaurant._id}>
                            <td>{restaurant._id}</td>
                            <td>{restaurant.nukkadName}</td>
                            <td>{restaurant.nukkadAddress}</td>
                            <td>{restaurant.city}</td>
                            <td>{restaurant.pincode}</td>
                            <td>{restaurant.landmark}</td>
                            <td>{restaurant.phoneNumber}</td>
                            <td>{restaurant.ownerName}</td>
                            <td>{restaurant.status}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
