import React, { useState } from 'react';
import './ScreenCss/auth.css';

function SigninSubAdmin() {
    const [passwordVisible, setPasswordVisible] = useState(false);
    const [adminid, setAdminid] = useState('');
    const [password, setPassword] = useState('');

    const togglePasswordVisibility = () => {
        setPasswordVisible(!passwordVisible);
    };

    return (
        <div className="App">
           <div className='adminhead'>Sub-Admin Portal</div>
            <div className="signin-card">
                <h1 className='fw-bold mt-3'>Sign In</h1>
                <div style={{ marginBlock: "70px" }}>
                    <div className="input-group mb-4 " >
                        <input type="text" className="form-control" id="floatingInput" placeholder="Admin ID" value={adminid} onChange={(e) => {setAdminid(e.target.value)}}/>

                    </div>

                    <div class="input-group mb-3 ">
                        <input type={passwordVisible ? "text" : "password"} value={password} class="form-control" id="floatingPassword"
                            placeholder="Password" aria-label="Example text with button addon" aria-describedby="button-addon1" onChange={(e) => {setPassword(e.target.value)}} />
                        <button class="btn btn-outline-secondary" type="button" id="button-addon1" onClick={togglePasswordVisibility}><span
                            className="password-toggle-icon"
                            onClick={togglePasswordVisibility}
                        >
                            <i className={passwordVisible ? "fas fa-eye-slash" : "fas fa-eye"}></i>
                        </span></button>
                    </div>
                    <button type="submit" className="login-button mt-5 fs-5">Login</button>

                </div>
            </div>
        </div>
    );
}

export default SigninSubAdmin;
