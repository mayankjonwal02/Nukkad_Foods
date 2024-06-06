import React, { useEffect, useState } from 'react';
import config from '../../config';

export default function Users() {
    const [users, setUsers] = useState([]);
    const [filteredUsers, setFilteredUsers] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchField, setSearchField] = useState('username'); // Default search field
    const { API_URL } = config;

    useEffect(() => {
        fetch(`${API_URL}/api/auth/fetchAllUsers`)
            .then(res => res.json())
            .then(data => {
                setUsers(data.users);
                setLoading(false);
            })
            .catch(error => {
                console.error("Error fetching users:", error);
                setLoading(false);
            });
    }, []);

    useEffect(() => {
        // Filter users based on search term and field
        const filtered = users.filter(user =>
            user[searchField].toLowerCase().includes(searchTerm.toLowerCase())
        );
        setFilteredUsers(filtered);
    }, [searchTerm, searchField, users]);

    const handleSearchTermChange = event => {
        setSearchTerm(event.target.value);
    };

    const handleSearchFieldChange = event => {
        setSearchField(event.target.value);
    };

    if (loading) {
        return (
            <div className='d-flex flex-column bg-white' style={{ minHeight: "100vh", maxWidth: "100vw", justifyContent: "center", alignItems: "center" }}>
                <div class="spinner-grow text-success" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        );
    }

    return (
        <div className='d-flex flex-column bg-white' style={{ minHeight: "100vh", maxWidth: "100vw", justifyContent: "flex-start", alignItems: "center" }}>
            <h1 className='m-5 fw-bold'>Users</h1>
            <div className="input-group mb-3 me-4" style={{ width: "50%" }}>
                <select className="form-select me-5" value={searchField} onChange={handleSearchFieldChange}>
                    <option value="username">Username</option>
                    <option value="email">Email</option>
                    <option value="contact">Contact</option>
                    <option value="gender">Gender</option>
                    <option value="area">Area</option>
                    <option value="colony">Colony</option>
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
            <table className="table">
                <thead>
                    <tr>
                        <th scope="col">Username</th>
                        <th scope="col">Email</th>
                        <th scope="col">Contact</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Area</th>
                        <th scope="col">Colony</th>
                        <th scope="col">Hint</th>
                        <th scope="col">Save As</th>
                    </tr>
                </thead>
                <tbody>
                    {filteredUsers.map(user => (
                        <tr key={user._id}>
                            <td>{user.username}</td>
                            <td>{user.email}</td>
                            <td>{user.contact}</td>
                            <td>{user.gender}</td>
                            <td>{user.area}</td>
                            <td>{user.colony}</td>
                            <td>{user.hint}</td>
                            <td>{user.saveAs}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
