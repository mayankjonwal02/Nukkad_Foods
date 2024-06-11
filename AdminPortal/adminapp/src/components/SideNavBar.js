import React from 'react';
import { Sidebar, Menu, MenuItem ,SubMenu} from 'react-pro-sidebar';
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';

const MenuItemComponent = ({ icon, text, link, id ,globalid, setglobalid,functions}) => {

  if(functions !== undefined){let role = localStorage.getItem("role");
    let backgroundColor =
    role === "admin"
      ? globalid === id
        ? "#7fffd4"
        : "white"
      : functions.includes(id)
      ? globalid === id
        ? "#7fffd4"
        : "white"
      : 
      id === "logout" || id === "home"
      ? globalid === id
        ? "#7fffd4"
        : "white"
      : "#B8B8B8";  
      
      return (
    <MenuItem style={{backgroundColor:backgroundColor,textAlign:"left"}} className='ms-2'  id={id} onClick={() => {
      if(functions.includes(id)  || id === 'logout' || id === 'home'){
      setglobalid(id)
      }

      if(role === "admin"){
        setglobalid(id)
      }
      
      }}>
      {icon} {text}
    </MenuItem>
  );}
}

export default function SideNavBar(props) {
  const navigate = useNavigate();
  return (
    <Sidebar width='300px'>
      <Menu
        menuItemStyles={{
          backgroundColor: '#ffffff',
          
          button: {
            // the active class will be added automatically by react router
            // so we can use it to style the active menu item
            [`&.active`]: {
              backgroundColor: '#000000',
              color: '#b6c8d9',
            },
          },
        }}
      >
        <div className="text-black fw-bold mt-3 mb-3 m-1" style={{ fontSize: "30px" }}>Nukkad Admin</div>
        {/* <div>{props.functions}</div> */}

        <MenuItemComponent  icon={<i className="fa-solid fa-house me-3"></i>} text="Home" link="" id="home" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions}/>
    <h4 className="m-3" style={{textAlign:"left"}}>General</h4>

        <MenuItemComponent icon={<i class="fa-solid fa-user me-3"></i>} text="Users" link="" id="users" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions}/>
        <MenuItemComponent icon={<i class="fa-solid fa-utensils me-3"></i>} text="Restaurants" link="" id="restaurant" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions} />
        <MenuItemComponent icon={<i class="fa-solid fa-bicycle me-3"></i>} text="Riders" link="" id="riders" globalid={props.globalid} setglobalid={props.setglobalid}  functions = {props.functions}/>

        <h4 className="m-3" style={{textAlign:"left"}}>Management</h4>
        <MenuItemComponent icon={<i class="fa-solid fa-id-card me-3"></i>} text="Nukkad Approval" link="" id="nukkadapproval" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions}/>
        <MenuItemComponent icon={<i class="fa-solid fa-credit-card me-3"></i>} text="Payment Requests" link="" id="paymentrequest" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions}/>
        <MenuItemComponent icon={<i class="fa-solid fa-comment me-3 me-3"></i>} text="complaints" link="" id="complaints" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions}/>
        <MenuItemComponent icon={<i class="fa-solid fa-pizza-slice me-3"></i>} text="Orders" link="" id="orders" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions}/>
        <MenuItemComponent icon={<i class="fa-solid fa-file-invoice me-3"></i>} text="Transactions" link="" id="transactions" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions}/>
        {localStorage.getItem('role') === 'admin' ? 
        <MenuItemComponent icon={<i class="fa-solid fa-user me-3"></i>} text="Departments" link="" id="department" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions}/> 
        : 
        <MenuItemComponent icon={<i class="fa-solid fa-users me-3"></i>} text="Sub-Admin Registration" link="" id="subadminregis" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions}/>
      }

        <MenuItemComponent icon={<i class="fa-solid fa-user me-3"></i>} text="Sub-Admins" link="" id="subadmins" globalid={props.globalid} setglobalid={props.setglobalid} functions = {props.functions}/>
        <MenuItemComponent icon={<i class="fa-solid fa-right-from-bracket me-3"></i>} text="Logout" link="" id="logout" globalid={props.globalid} setglobalid={props.setglobalid}  functions = {props.functions}/>
      </Menu>
    </Sidebar>
  );
};
