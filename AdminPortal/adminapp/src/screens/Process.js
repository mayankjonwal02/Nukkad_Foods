import React ,{useState} from 'react'
import SideNavBar from '../components/SideNavBar'
import SignupAdmin from './SignupAdmin'

export default function Process() {

    const [globalid , setglobalid] = useState('hello')
  return (
    <div className="bg-white" style={{ display: "flex", flexDirection: "row", height: "100vh", width: "100vw" }}>
      <SideNavBar globalid={globalid} setglobalid={setglobalid} />
      <div className="bg-danger" style={{ display: "flex", flexGrow: 1, height: "100vh" }}>
        <div style={{ flexGrow: 1 }}>
          <SignupAdmin />
        </div>
      </div>
    </div>
  )
}
