import React, { useEffect, useState } from 'react';
import config from '../../config';
import './Restaurants.css'; // Import your custom CSS file for styling

export default function Orders() {
    const [orders, setOrders] = useState([]);
    const [filteredOrders, setFilteredOrders] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchField, setSearchField] = useState('orderId'); // Default search field
    const [selectedRestaurant, setSelectedRestaurant] = useState(''); // Add state for selected restaurant ID
    const { API_URL } = config;

    useEffect(() => {
        fetch(`${API_URL}/api/order/getAllOrders`)
            .then(res => res.json())
            .then(data => {
                console.log("Fetched orders:", data.orders); // Log the fetched orders

                // Flatten the orders data structure
                const flattenedOrders = data.orders.flatMap(restaurant => 
                    restaurant.orders.map(order => ({
                        ...order,
                        restaurantId: restaurant.uid // Add restaurant ID to each order
                    }))
                );

                setOrders(flattenedOrders);
                setFilteredOrders(flattenedOrders); // Initialize filtered list with all orders
                setLoading(false);
            })
            .catch(error => {
                console.error("Error fetching orders:", error);
                setLoading(false);
            });
    }, []);
    
    useEffect(() => {
        // Filter orders based on search term, field, and selected restaurant
        const filtered = orders.filter(order => 
            (order && order[searchField] && order[searchField].toLowerCase().includes(searchTerm.toLowerCase())) &&
            (!selectedRestaurant || order.restaurantId === selectedRestaurant)
        );
        console.log("Filtered orders:", filtered); // Log the filtered orders
        setFilteredOrders(filtered);
    }, [searchTerm, searchField, orders, selectedRestaurant]);
    
    const handleSearchTermChange = event => {
        setSearchTerm(event.target.value);
    };

    const handleSearchFieldChange = event => {
        setSearchField(event.target.value);
    };

    const handleRestaurantChange = event => {
        setSelectedRestaurant(event.target.value);
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
            <div className="input-group mb-3 me-4" style={{ width: "50%" }}>
                <select className="form-select me-5" value={selectedRestaurant} onChange={handleRestaurantChange}>
                    <option value="">All Restaurants</option>
                    {Array.from(new Set(orders.map(order => order.restaurantId))).map(restaurantId => (
                        <option key={restaurantId} value={restaurantId}>
                            {restaurantId}
                        </option>
                    ))}
                </select>
            </div>
            <table className="table smaller-font">
                <thead>
                    <tr>
                        <th scope="col">Restaurant ID</th>
                        <th scope="col">Order ID</th>
                        <th scope="col">Date</th>
                        <th scope="col">Time</th>
                        <th scope="col">Ordered By ID</th>
                        <th scope="col">Ordered By Name</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    {filteredOrders.map(order => (
                        <tr key={order._id}>
                            <td>{order.restaurantId}</td>
                            <td>{order.orderId}</td>
                            <td>{new Date(order.date).toLocaleDateString()}</td>
                            <td>{order.time}</td>
                            <td>{order.orderByid}</td>
                            <td>{order.orderByName}</td>
                            <td>{order.status}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
