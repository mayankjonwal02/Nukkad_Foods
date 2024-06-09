import React, { useEffect, useState } from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPen, faPlusCircle } from '@fortawesome/free-solid-svg-icons'
import "./Restaurants.css"
import config from '../../config'
import SignupSubAdmin from '../SignupAdmin'
import roles from '../../components/roles'
import { set } from 'rsuite/esm/internals/utils/date'


export default function Department() {
    const [departments, setDepartments] = useState([]);
    const [department, setDepartment] = useState('')
    const [currentDept, setCurrentDept] = useState("")
    const [deptID , setDeptID] = useState("");
    const [loading, setLoading] = useState(true);
    const [funcloading, setFuncLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [selectedRoles, setSelectedRoles] = useState([]);
    const { API_URL } = config;


    const handleRoleChange = (event, roleId) => {
        const isChecked = event.target.checked;
    
        if (isChecked) {
          setSelectedRoles([...selectedRoles, roleId]);
        } else {
          setSelectedRoles(selectedRoles.filter((id) => id !== roleId));
        }
      };

   

    const updateDept = async () => {
        await fetch(`${API_URL}/api/department/updateDepartment`,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    id: deptID,
                    departmentName: currentDept,
                    options: selectedRoles
                })
            }
        )
            .then(res => res.json())
            .then(data => {
                // alert(data.message)
                // setLoading(true)
                    // fetch(`${API_URL}/api/department/getDepartments`)
                    //     .then(res => res.json())
                    //     .then(data => {
                    //         setDepartments(data.departments);
                    //         setLoading(false);
                    //     })
                    //     .catch(error => {
                    //         console.error("Error fetching departments:", error);
                        // });
                
            })
            .catch(error => {
                alert("Failed to update roles", error)
                // setLoading(true)
                    // fetch(`${API_URL}/api/department/getDepartments`)
                    //     .then(res => res.json())
                    //     .then(data => {
                    //         setDepartments(data.departments);
                    //         setLoading(false);
                    //     })
                    //     .catch(error => {
                    //         console.error("Error fetching departments:", error);
                    //     });
                
            });

            setLoading(true)
                    await fetch(`${API_URL}/api/department/getDepartments`)
                        .then(res => res.json())
                        .then(data => {
                            setDepartments(data.departments);
                            setLoading(false);
                        })
                        .catch(error => {
                            console.error("Error fetching departments:", error);
                            setLoading(false);
                            alert("Error fetching departments:", error);
                        });
           
    }
    const handleSubmit = () => {
        if (department === '') {
            alert("Department name cannot be empty")
            return
        }
        try {
            fetch(`${API_URL}/api/department/addDepartment`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    departmentName: department.charAt(0).toUpperCase() + department.slice(1).toLowerCase(),
                    options: []
                })
            }).then(res => res.json())
                .then(data => {
                    alert(data.message)
                    setLoading(true)
                    fetch(`${API_URL}/api/department/getDepartments`)
                        .then(res => res.json())
                        .then(data => {
                            setDepartments(data.departments);
                            setLoading(false);
                        })
                        .catch(error => {
                            console.error("Error fetching departments:", error);
                        });
                })
                .catch(error => {
                    alert("Failed to add department", error)
                })
        } catch (error) {
            alert("Failed to add department", error)
        }
    }
    useEffect(() => {
        fetch(`${API_URL}/api/department/getDepartments`)
            .then(res => res.json())
            .then(data => {
                setDepartments(data.departments);
                setLoading(false);
            })
            .catch(error => {
                console.error("Error fetching departments:", error);
            });
    }, []);



    useEffect(() => {
        roles.forEach(role => {
            if (selectedRoles.includes(role.id)) {
                role.checked = true
            }
        })
    }

        , [selectedRoles])

    const filteredDepartments = departments.filter((dept) =>
        dept.departmentName.toLowerCase().includes(searchTerm.toLowerCase())
    );
    if (loading) {
        return (
            <div className='d-flex flex-column bg-white' style={{ minHeight: "100vh", maxWidth: "100vw", justifyContent: "center", alignItems: "center" }}>
            <div class="spinner-grow text-success" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
        )
    }
    return (
        <div className='bg-white' style={{ minHeight: "100vh", justifyContent: "flex-start", alignItems: "center", display: "flex", flexDirection: "column" }}>
            <h1 className='fw-bold m-5'>Department</h1>
            {AddDepartment(department, setDepartment, handleSubmit)}
            <div className='bg-white p-5' style={{ flexGrow: 1, width: "100%    " }}>
                <div className='m-5 '>
                    <input
                        type='text'
                        className='form-control'
                        style={{ fontFamily: "FontAwesome , monospace;", fontSize: "15px" }}
                        placeholder='Search by Department Name...'
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
                    />
                </div>
                <div className="row justify-content-center">
                    {filteredDepartments.map((department, index) => (
                        <div key={index} className="col-md-4 col-sm-6 mb-4" >
                            <div className="shadow-lg card w-100 departmentcard" >
                                <div className="card-body ">
                                <div className='d-flex flex-row justify-content-between'>

                                    <h5 className="card-title text-center"  >{department.departmentName}</h5>
                                    <FontAwesomeIcon icon={faPen} size='1x' data-bs-toggle="modal" data-bs-target="#exampleModal_update" onClick={() => {
                                        setDeptID(department._id)
                                            setCurrentDept(department.departmentName)
                                            setSelectedRoles(department.options)
                                    }}/>
                                </div>
                                    <div className='d-flex flex-row justify-content-between mt-4 gap-4'>

                                        <button type="button" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#exampleModal_regis" onClick={() => setCurrentDept(department.departmentName)}>Add Sub-Admin</button>
                                        <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal_roles" onClick={() => {
                                            setDeptID(department._id)
                                            setCurrentDept(department.departmentName)
                                            setSelectedRoles(department.options)
                                            // fetchroles()
                                        }}>Edit Roles</button>
                                    </div>

                                </div>
                            </div>
                        </div>



                    ))}

                    <div class="modal fade   " id="exampleModal_regis" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable  modal-fullscreen p-5" >
                            <div class="modal-content">
                                <div class="modal-header">

                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body " style={{ backgroundColor: "#7fffd4" }}>
                                    <SignupSubAdmin department={currentDept} />
                                </div>

                            </div>
                        </div>
                    </div>

                    {/* {EditDepartmentDialog(handleRoleChange, roles, selectedRoles, setSelectedRoles,fetchroles,updateDept)} */}
                    <div class="modal fade   " id="exampleModal_roles" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable   p-5" >
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h2>Edit Roles</h2>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body " style={{ backgroundColor: "#7fffd4" }}>
                                    
                                    <div className='p-5 d-flex flex-column'>
                                        {
                                        
                                            roles.map((role) => (
                                                <div class="form-check">
                                                    <input key={role.id} class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked={selectedRoles.includes(role.id)}  onChange={(e) => handleRoleChange(e, role.id)} />
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        {role.name}
                                                    </label>
                                                </div>
                                            ))
                                        }
                                    </div>
                                </div>
                               
                                <button type="button" class="btn btn-primary " data-bs-dismiss="modal" aria-label="Close" onClick={() => {
                                    updateDept()   
                                }}>Update</button>

                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="exampleModal_update" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Update Department</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="input-group">
                                <span class="input-group-text">Department</span>
                                <input type="text" aria-label="Department" class="form-control" value={currentDept} onChange={(e) => { setCurrentDept(e.target.value) }} />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-success" data-bs-dismiss="modal" onClick={() => { updateDept() }}>Add</button>
                        </div>
                    </div>
                </div>
            </div>

                </div>
            </div>

        </div>

    )
}


function RegistrationDialog() {
    return (

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Department</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="input-group">
                            <span class="input-group-text">Department</span>
                            <input type="text" aria-label="Department" class="form-control" onChange={(e) => { }} />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success" data-bs-dismiss="modal" onClick={() => { }}>Add</button>
                    </div>
                </div>
            </div>
        </div>



    )
}



function AddDepartment(
    department, setDepartment, handleSubmit
) {






    return (
        <div>
            <FontAwesomeIcon icon={faPlusCircle} size='3x' className='text-success' data-bs-toggle="modal" data-bs-target="#exampleModal" />

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Add Department</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="input-group">
                                <span class="input-group-text">Department</span>
                                <input type="text" aria-label="Department" class="form-control" value={department} onChange={(e) => { setDepartment(e.target.value) }} />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-success" data-bs-dismiss="modal" onClick={() => { handleSubmit() }}>Add</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    )
}
