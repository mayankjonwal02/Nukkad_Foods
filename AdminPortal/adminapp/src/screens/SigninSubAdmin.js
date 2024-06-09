import React, { useState } from 'react';
import './ScreenCss/auth.css';
import config from '../config';
import { useNavigate } from 'react-router-dom';
function SigninSubAdmin() {
    const [passwordVisible, setPasswordVisible] = useState(false);
    const [adminid, setAdminid] = useState('');
    const [password, setPassword] = useState('');
    const { API_URL } = config;
    const navigate = useNavigate();

    const togglePasswordVisibility = () => {
        setPasswordVisible(!passwordVisible);
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        try {
            const response = await fetch(`${API_URL}/api/subadmin/SubAdminLogin`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    UniqueId:  adminid,
                    password: password
                })
            });

            const data = await response.json();
            alert(data.message);
            if (response.ok) {
                // Login successful
                
                if (data.executed) {
                    localStorage.setItem('admin', adminid);
                    localStorage.setItem('password', password);
                    localStorage.setItem('login', true);
                    localStorage.setItem('role', 'subAdmin');
                    localStorage.setItem('department', data.subAdmin.department);
                    localStorage.setItem('options', data.subAdmin.options);
                    navigate('/process');

                }
                
            } else {
                // Login failed
                console.error('Login failed:', data.message);
            }
        } catch (error) {
            console.error('Error:', error);
        }
    };

    return (
        <div className="App">
            <div className='adminhead'>Sub-Admin Portal</div>
            <div className="signin-card">
                <h1 className='fw-bold mt-3'>Sign In</h1>
                <div style={{ marginBlock: "70px" }}>
                    <form >
                        <div className="input-group mb-4 " >
                            <input type="text" className="form-control" id="floatingInput" placeholder="Admin ID" value={adminid} onChange={(e) => { setAdminid(e.target.value) }} />
                        </div>

                        <div className="input-group mb-3 ">
                            <input type={passwordVisible ? "text" : "password"} value={password} className="form-control" id="floatingPassword"
                                placeholder="Password" aria-label="Example text with button addon" aria-describedby="button-addon1" onChange={(e) => { setPassword(e.target.value) }} />
                            <button className="btn btn-outline-secondary" type="button" id="button-addon1" onClick={togglePasswordVisibility}>
                                <span className="password-toggle-icon">
                                    <i className={passwordVisible ? "fas fa-eye-slash" : "fas fa-eye"}></i>
                                </span>
                            </button>
                        </div>
                        <button onClick={handleSubmit} className="login-button mt-5 fs-5">Login</button>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default SigninSubAdmin;
