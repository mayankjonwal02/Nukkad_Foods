import React, { useState } from 'react'
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

export default function Process() {

  const [globalid, setglobalid] = useState('home')
  const navigate = useNavigate();
  return (
    <div className="bg-white" style={{ display: "flex", flexDirection: "row", height: "100vh", width: "100vw" }}>
      <SideNavBar globalid={globalid} setglobalid={setglobalid} />
      <div className="bg-danger" style={{ display: "flex", flexGrow: 1, height: "100vh" }}>
        <div style={{ flexGrow: 1 }}>
          {globalid === 'subadminregis' && <SignupSubAdmin />}
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
