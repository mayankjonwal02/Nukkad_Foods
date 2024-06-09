import React, { useEffect, useState } from 'react'
import SideNavBar from '../components/SideNavBar'
import SignupSubAdmin from './SignupAdmin'
import { useNavigate } from 'react-router-dom'
import Users from './NavbarBased/Users'
import Restaurants from './NavbarBased/Restaurants'
import DeliveryBoy from './NavbarBased/Delivery'
import NukkadApproval from './NavbarBased/NukkadApproval'
import Complaints from './NavbarBased/Complaints'
import Orders from './NavbarBased/Orders'
import ShowSubAdmins from './NavbarBased/ShowSubAdmins'
import Department from './NavbarBased/Department'

import config from '../config'
import { set } from 'rsuite/esm/internals/utils/date'

export default function Process() {

  const [globalid, setglobalid] = useState('home')
  const [Functions , setFunctions] = useState([])
  const { API_URL } = config;
  useEffect(() => {
    if (localStorage.getItem('role') === 'subAdmin') {
      let department = localStorage.getItem('department')
      fetch(`${API_URL}/api/department/getDepartmentByName` ,{
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          departmentName: department
        })
      
        })
        .then(res => res.json())
        .then(data => {
          setFunctions(data.department.options ||   [])
        
        })
        .catch(error => {
          console.error("Error fetching departments:", error);
          setFunctions([])
        });
    } 
  }, [])
  const navigate = useNavigate();
  return (
    <div className="bg-white" style={{ display: "flex", flexDirection: "row", height: "100vh", width: "100vw" }}>
      <SideNavBar globalid={globalid} setglobalid={setglobalid} functions={Functions} />
      <div className="bg-danger" style={{ display: "flex", flexGrow: 1, height: "100vh" }}>
        <div style={{ flexGrow: 1 }}>
          {globalid === 'subadminregis' && <SignupSubAdmin department={localStorage.getItem('department')}/>}
          {globalid === 'logout' && (
            <>
              {localStorage.clear()}
              {navigate('/')}
            </>
          )}
          {globalid === 'users' && <Users />}
          {globalid === 'restaurant' && <Restaurants />}
          {globalid === 'riders' && <DeliveryBoy />}
          {globalid === 'nukkadapproval' && <NukkadApproval />}
          {globalid === 'complaints' && <Complaints />}
          {globalid === 'orders' && <Orders />}
          {globalid === 'subadmins' && <ShowSubAdmins />}
          {globalid === 'department' && <Department />}
        </div>
      </div>
    </div>
  )
}
