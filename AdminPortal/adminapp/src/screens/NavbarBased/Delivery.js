import React, { useEffect, useState } from 'react';
import config from '../../config';
import './Restaurants.css'; // Import your custom CSS file for styling

export default function DeliveryBoys() {
    const [deliveryBoys, setDeliveryBoys] = useState([]);
    const [filteredDeliveryBoys, setFilteredDeliveryBoys] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchField, setSearchField] = useState('name'); // Default search field
    const { API_URL } = config;

    useEffect(() => {
        fetch(`${API_URL}/api/auth/getAllDeliveryBoys`)
            .then(res => res.json())
            .then(data => {
                setDeliveryBoys(data.deliveryBoys);
                setFilteredDeliveryBoys(data.deliveryBoys); // Initialize filtered list with all delivery boys
                setLoading(false);
            })
            .catch(error => {
                console.error("Error fetching delivery boys:", error);
                setLoading(false);
            });
    }, []);

    useEffect(() => {
        // Filter delivery boys based on search term and field
        const filtered = deliveryBoys.filter(deliveryBoy =>
            deliveryBoy[searchField].toLowerCase().includes(searchTerm.toLowerCase())
        );
        setFilteredDeliveryBoys(filtered);
    }, [searchTerm, searchField, deliveryBoys]);

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
            <h1 className='m-5 fw-bold'>Delivery Boys</h1>
            <div className="input-group mb-3 me-4" style={{ width: "50%" }}>
                <select className="form-select me-5" value={searchField} onChange={handleSearchFieldChange}>
                    <option value="name">Name</option>
                    <option value="email">Email</option>
                    <option value="contact">Contact</option>
                    <option value="city">City</option>
                    <option value="gender">Gender</option>
                    <option value="DOB">Date of Birth</option>
                    <option value="whatsappContact">WhatsApp Contact</option>
                    <option value="alternateNumber">Alternate Number</option>
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
            <table className="table smaller-font">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Contact</th>
                        <th scope="col">City</th>
                        <th scope="col">Gender</th>
                        <th scope="col">DOB</th>
                        <th scope="col">WhatsApp Contact</th>
                        <th scope="col">Alternate Number</th>
                    </tr>
                </thead>
                <tbody>
                    {filteredDeliveryBoys.map(deliveryBoy => (
                        <tr key={deliveryBoy._id}>
                            <td>{deliveryBoy._id}</td>
                            <td>{deliveryBoy.name}</td>
                            <td>{deliveryBoy.email}</td>
                            <td>{deliveryBoy.contact}</td>
                            <td>{deliveryBoy.city}</td>
                            <td>{deliveryBoy.gender}</td>
                            <td>{new Date(deliveryBoy.DOB).toLocaleDateString()}</td>
                            <td>{deliveryBoy.whatsappContact}</td>
                            <td>{deliveryBoy.alternateNumber}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
