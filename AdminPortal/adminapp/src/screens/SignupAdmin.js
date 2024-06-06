import React, { useState } from 'react';

import config from '../config'

function SignupSubAdmin() {
  const [passwordVisible, setPasswordVisible] = useState(false);
  const [passwordVisible1, setPasswordVisible1] = useState(false);
  const [adminid, setAdminid] = useState('');
  const [password, setPassword] = useState('');
  const [confirmpassword, setConfirmpassword] = useState('');
  const { API_URL } = config;

  const togglePasswordVisibility = () => {
    setPasswordVisible(!passwordVisible);
  };

  const togglePasswordVisibility1 = () => {
    setPasswordVisible1(!passwordVisible1);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
   
    
    // Creating sub-admin data object
    const subAdminData = {
      managerId: localStorage.getItem('admin'),
      UniqueId: adminid,
      password: password,
      options: [] // You might need to adjust this based on your requirements
    };

    try {
      // Calling the API to create sub-admin
      const response = await fetch(`${API_URL}/api/subadmin/createSubAdmin`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(subAdminData)
      });



      if (response.ok) {
        // Sub-admin created successfully, you can redirect or show a success message
        const data = await response.json();
        alert(data.message);

      } 
      else if(response.status === 400) {
        // Error occurred while creating sub-admin, handle the error
        const data = await response.json();
        alert(data.message);
      }
      else {
        alert('Error creating sub-admin');
      }
    } catch (error) {
      alert('Error:', error);
    }
  };

  return (
    <div className="Appsub">
      {/* <div className='text-white fw-bold m-5' style={{ fontSize: "70px" }}>ADMIN Portal</div> */}
      <div className="signin-card">
        <h1 className='fw-bold mt-3'>Registration</h1>
        <form style={{marginBlock:"70px"}} >
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
          <button onClick={handleSubmit} className="login-button mt-5 fs-5">Register</button>
        
        </form>
      </div>
    </div>
  );
}

export default SignupSubAdmin;
