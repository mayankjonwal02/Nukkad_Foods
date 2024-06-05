import React, { useEffect, useState } from 'react';
import config from '../../config';
import './Restaurants.css'; // Import your custom CSS file for styling

export default function Orders() {
    const [orders, setOrders] = useState([]);
    const [filteredOrders, setFilteredOrders] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchField, setSearchField] = useState('orderId'); // Default search field
    const { API_URL } = config;

    useEffect(() => {
        fetch(`${API_URL}/api/order/getAllOrders`)
            .then(res => res.json())
            .then(data => {
                console.log("Fetched orders:", data.orders); // Log the fetched orders
                setOrders(data.orders);
                setFilteredOrders(data.orders); // Initialize filtered list with all orders
                setLoading(false);
            })
            .catch(error => {
                console.error("Error fetching orders:", error);
                setLoading(false);
            });
    }, []);
    
    useEffect(() => {
        // Filter orders based on search term and field
        const filtered = orders.filter(order =>
            order && order[searchField] && order[searchField].toLowerCase().includes(searchTerm.toLowerCase())
        );
        console.log("Filtered orders:", filtered); // Log the filtered orders
        setFilteredOrders(filtered);
    }, [searchTerm, searchField, orders]);
    

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
            <h1 className='m-5 fw-bold'>Orders</h1>
            <div className="input-group mb-3 me-4" style={{ width: "50%" }}>
                <select className="form-select me-5" value={searchField} onChange={handleSearchFieldChange}>
                    <option value="orderId">Order ID</option>
                    <option value="date">Date</option>
                    <option value="time">Time</option>
                    <option value="orderByName">Ordered By Name</option>
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
            <table className="table smaller-font">
                <thead>
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Date</th>
                        <th scope="col">Time</th>
                        <th scope="col">Ordered By Name</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    {orders.map(order => (
                        <tr key={order._id}>
                            <td>{order.orderId}</td>
                            <td>{order.date}</td>
                            <td>{order.time}</td>
                            <td>{order.orderByName}</td>
                            <td>{order.status}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
