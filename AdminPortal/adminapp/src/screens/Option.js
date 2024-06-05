import React from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faUser, faUsers } from '@fortawesome/free-solid-svg-icons';
import "./ScreenCss/Option.css"
import { useNavigate } from 'react-router-dom';
export default function Option() {
  // #7fffd4
  const navigate = useNavigate();
  return (
    <div style={{}}>

      <div className=' ' style={{ display: "flex",flex:1,minHeight:"100vh", flexDirection: "column", justifyContent: "center", alignItems: "center", backgroundColor: "#7fffd4",  width: "100vw", overflowY: "scroll" }} >
        <h1 className='text-success fw-bold mb-5 headtext' >Who are you ?</h1>
       
        <div className='myheaddiv '>
        <div onClick={() => {navigate("signinadmin")}} className='opcards gap-4 card rounded-circle fw-bold  d-flex flex-column  justify-content-center align-items-center'>
        <FontAwesomeIcon icon={faUser}  className='cardfa m-2' />
            <div className=' textfa'>Admin</div>
        </div>
        <div onClick={() => {navigate("signinsubadmin")}} className='opcards gap-4 card rounded-circle fw-bold d-flex flex-column  justify-content-center align-items-center'>
        <FontAwesomeIcon icon={faUsers}  className='cardfa m-2' />
            <div className='  textfa'>Sub-Admin</div>
        </div>
      </div>
      </div>
    </div>
  )
}
