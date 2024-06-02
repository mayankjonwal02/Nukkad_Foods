import React, { useState } from 'react';
import './auth.css';

function SignupAdmin() {
  const [passwordVisible, setPasswordVisible] = useState(false);
  const [passwordVisible1, setPasswordVisible1] = useState(false);
  const [adminid, setAdminid] = useState('');
  const [password, setPassword] = useState('');
  const [confirmpassword, setConfirmpassword] = useState('');
  const togglePasswordVisibility = () => {
    setPasswordVisible(!passwordVisible);
  };

  const togglePasswordVisibility1 = () => {
    setPasswordVisible1(!passwordVisible1);
  };

  return (
    <div className="Appsub">
      {/* <div className='text-white fw-bold m-5' style={{ fontSize: "70px" }}>ADMIN Portal</div> */}
      <div className="signin-card">
        <h1 className='fw-bold mt-3'>Registration</h1>
        <form style={{marginBlock:"70px"}}>
          <div className="input-group mb-4 " >
            <input type="text" className="form-control" id="floatingInput" placeholder="Unique ID"  value={adminid} onChange={(e) => {setAdminid(e.target.value)}}/>
            
          </div>
         
          <div class="input-group mb-3 ">
            <input type={passwordVisible ? "text" : "password"} class="form-control" id="floatingPassword"
              placeholder="Password" aria-label="Example text with button addon" aria-describedby="button-addon1" 
              value={password} onChange={(e) => {setPassword(e.target.value)}}
              />
            <button class="btn btn-outline-secondary" type="button" id="button-addon1" onClick={togglePasswordVisibility}><span
              className="password-toggle-icon"
              onClick={togglePasswordVisibility}
            >
              <i className={passwordVisible ? "fas fa-eye-slash" : "fas fa-eye"}></i>
            </span></button>
          </div>
          <div class="input-group mb-3 ">
            <input type={passwordVisible1 ? "text" : "password"} class="form-control" id="floatingPassword"
              placeholder="Confirm Password" aria-label="Example text with button addon" aria-describedby="button-addon1"
              value={confirmpassword} onChange={(e) => {setConfirmpassword(e.target.value)}}/>
            <button class="btn btn-outline-secondary" type="button" id="button-addon1" onClick={togglePasswordVisibility1}><span
              className="password-toggle-icon"
              onClick={togglePasswordVisibility1}
            >
              <i className={passwordVisible1 ? "fas fa-eye-slash" : "fas fa-eye"}></i>
            </span></button>
          </div>
          <button  className="login-button mt-5 fs-5">Register</button>
        
        </form>
      </div>
    </div>
  );
}

export default SignupAdmin;
