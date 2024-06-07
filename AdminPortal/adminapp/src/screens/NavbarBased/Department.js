import React from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlusCircle } from '@fortawesome/free-solid-svg-icons'

export default function Department() {
    return (
        <div className='bg-white' style={{ minHeight: "100vh", justifyContent: "flex-start", alignItems: "center", display: "flex", flexDirection: "column" }}>
            <h1 className='fw-bold m-5'>Nukkad Approval</h1>
            {addDepartment()}
            <div className='bg-danger' style={{ flexGrow: 1, width: "fit-content" }}>

            </div>
        </div>

    )
}



const addDepartment = () => {
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
                                <input type="text" aria-label="Department" class="form-control" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-success">Add</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    )
}
