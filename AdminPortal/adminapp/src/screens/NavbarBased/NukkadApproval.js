import React, { useEffect, useState } from 'react';
import config from '../../config';
import './Restaurants.css'; // Import your custom CSS file for styling


export default function NukkadApproval() {
    const [nukkadList, setNukkadList] = useState([]);
    const [filteredNukkadList, setFilteredNukkadList] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchField, setSearchField] = useState('nukkadName');
    const { API_URL } = config;
    const [data, setData] = useState({});
    const [pic, setPic] = useState("")

    useEffect(() => {
        fetch(`${API_URL}/api/auth/fetchAllRestaurants`)
            .then(res => res.json())
            .then(data => {
                const unverifiedNukkads = data.restaurants.filter(nukkad => nukkad.status === 'unverified');
                setNukkadList(unverifiedNukkads);
                setFilteredNukkadList(unverifiedNukkads);
                setLoading(false);
            })
            .catch(error => {
                console.error("Error fetching unverified nukkads:", error);
                setLoading(false);
            });
    }, []);

    useEffect(() => {
        if (data) {
            const images = [
                data.ownerPhoto,
                data.signature,
                data.fssaiDetails?.certificate,
                data.gstDetails?.gstCertificate,
                data.kycDetails?.aadhar,
                data.kycDetails?.pan,
            ];
            images.forEach((src) => {
                if (src) {
                    const img = new Image();
                    img.src = src;
                }
            });

            setPic(data.ownerPhoto);
        }
    }, [data]);

    useEffect(() => {
        // Filter nukkad list based on search term and field
        const filtered = nukkadList.filter(nukkad =>
            nukkad[searchField].toLowerCase().includes(searchTerm.toLowerCase())
        );
        setFilteredNukkadList(filtered);
    }, [searchTerm, searchField, nukkadList]);

    const handleVerifyNukkad = (id) => {

        try {

            fetch(`${API_URL}/api/auth/updateRestaurantById`,
                {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ _id: id, updateData: { status: 'verified' } }),
                }
            ).then(res => res.json()).then(data => {
                if (data.executed) {
                    alert('Nukkad verified successfully');
                    setLoading(true);
                    fetch(`${API_URL}/api/auth/fetchAllRestaurants`)
                        .then(res => res.json())
                        .then(data => {
                            const unverifiedNukkads = data.restaurants.filter(nukkad => nukkad.status === 'unverified');
                            setNukkadList(unverifiedNukkads);
                            setFilteredNukkadList(unverifiedNukkads);
                            setLoading(false);
                        })
                        .catch(error => {
                            console.error("Error fetching unverified nukkads:", error);
                            setLoading(false);
                        });
                } else {
                    alert('Failed to verify nukkad');
                }
            }

            )
        } catch (error) {
            alert('Failed to verify nukkad', error);
        }
    };


    const handleInvalidNukkad = (id) => {

        try {

            fetch(`${API_URL}/api/auth/updateRestaurantById`,
                {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ _id: id, updateData: { status: 'Invalid' } }),
                }
            ).then(res => res.json()).then(data => {
                if (data.executed) {
                    alert('Nukkad Removed successfully');
                    setLoading(true);
                    fetch(`${API_URL}/api/auth/fetchAllRestaurants`)
                        .then(res => res.json())
                        .then(data => {
                            const unverifiedNukkads = data.restaurants.filter(nukkad => nukkad.status === 'unverified');
                            setNukkadList(unverifiedNukkads);
                            setFilteredNukkadList(unverifiedNukkads);
                            setLoading(false);
                        })
                        .catch(error => {
                            console.error("Error fetching unverified nukkads:", error);
                            setLoading(false);
                        });
                } else {
                    alert('Failed to verify nukkad');
                }
            }

            )
        } catch (error) {
            alert('Failed to verify nukkad', error);
        }
    };

    if (loading) {
        return (
            <div className='d-flex flex-column bg-white' style={{ minHeight: "100vh", maxWidth: "100vw", justifyContent: "center", alignItems: "center" }}>
                <div className="spinner-grow text-success" role="status">
                    <span className="visually-hidden">Loading...</span>
                </div>
            </div>
        );
    }

    return (
        <div className='d-flex flex-column bg-white' style={{ minHeight: "100vh", maxWidth: "100vw", justifyContent: "flex-start", alignItems: "center" }}>
            <h1 className='m-5 fw-bold'>Nukkad Approval</h1>
            <div className="input-group mb-3 me-4" style={{ width: "50%" }}>
                <select className="form-select me-5" value={searchField} onChange={(e) => setSearchField(e.target.value)}>
                    <option value="nukkadName">Nukkad Name</option>
                    <option value="nukkadAddress">Nukkad Address</option>
                    <option value="city">City</option>
                    <option value="pincode">Pincode</option>
                    <option value="ownerName">Owner Name</option>
                    <option value="ownerEmail">Owner Email</option>
                    <option value="currentAddress">Current Address</option>
                    <option value="permananetAddress">Permanent Address</option>
                </select>
                <input
                    type="text"
                    placeholder={`Search by ${searchField}...`}
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    className="form-control"
                    style={{ width: "50%" }}
                />
            </div>
            <table className="table smaller-font">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nukkad Name</th>
                        <th scope="col">Nukkad Address</th>
                        <th scope="col">City</th>
                        <th scope="col">Pincode</th>
                        <th scope="col">Owner Name</th>
                        <th scope="col">Owner Email</th>
                        <th scope="col">Current Address</th>
                        <th scope="col">Permanent Address</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {filteredNukkadList.map(nukkad => (
                        <tr key={nukkad._id}>
                            <td>{nukkad._id}</td>
                            <td>{nukkad.nukkadName}</td>
                            <td>{nukkad.nukkadAddress}</td>
                            <td>{nukkad.city}</td>
                            <td>{nukkad.pincode}</td>
                            <td>{nukkad.ownerName}</td>
                            <td>{nukkad.ownerEmail}</td>
                            <td>{nukkad.currentAddress}</td>
                            <td>{nukkad.permananetAddress}</td>
                            <td>
                                <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"

                                    onClick={
                                        () => {
                                            setPic("")
                                            setData(nukkad)} //    handleVerifyNukkad(nukkad._id)
                                    }
                                    className="bg-primary text-white rounded-2">Verify</button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
            {InfoModal(data, pic, setPic,handleVerifyNukkad,handleInvalidNukkad)}
        </div>
    );
}



function InfoModal(data, pic, setPic,handleVerifyNukkad,handleInvalidNukkad) {

    return (
        <div className="modal fade" id="exampleModal" tabIndex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div className="modal-dialog modal-dialog-centered modal-xl">
                <div className="modal-content">
                    <div className="modal-header">
                        <h1 className="modal-title fs-5" id="exampleModalLabel">Verify {data.nukkadName}</h1>
                        <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div className="modal-body">
                        {/* {data && Object.keys(data).length > 0 ? (
                            <div style={{ display: "none" }}>
                                <img src={data.ownerPhoto} height={"300px"} loading='lazy' alt="Owner Photo" />
                                <img src={data.signature} height={"300px"} loading='lazy' alt="Signature" />
                                <img src={data.fssaiDetails?.certificate} height={"300px"} loading='lazy' alt="FSSAI Certificate" />
                                <img src={data.gstDetails?.gstCertificate} height={"300px"} loading='lazy' alt="GST Certificate" />
                                <img src={data.kycDetails?.aadhar} height={"300px"} loading='lazy' alt="Aadhar" />
                                <img src={data.kycDetails?.pan} height={"300px"} loading='lazy' alt="PAN" />
                            </div>
                        ) : null} */}
                        <div style={{ display: "flex", flexDirection: "row", justifyContent: "space-between" }}>
                            <div className='overflow-auto d-flex flex-column gap-2'>
                                <button type="button" className="bg-primary text-white rounded-2 h-fit w-fit" onClick={() => setPic(data.ownerPhoto)}>View Owner Photo</button>
                                <button type="button" className="bg-primary text-white rounded-2 h-fit w-fit" onClick={() => setPic(data.signature)}>View Signature</button>
                                <button type="button" className="bg-primary text-white rounded-2 h-fit w-fit" onClick={() => setPic(data.fssaiDetails?.certificate)}>View FSSAI Certificate</button>
                                <button type="button" className="bg-primary text-white rounded-2 h-fit w-fit" onClick={() => setPic(data.gstDetails?.gstCertificate)}>View GST Certificate</button>
                                <button type="button" className="bg-primary text-white rounded-2 h-fit w-fit" onClick={() => setPic(data.kycDetails?.aadhar)}>View Aadhar</button>
                                <button type="button" className="bg-primary text-white rounded-2 h-fit w-fit" onClick={() => setPic(data.kycDetails?.pan)}>View PAN</button>
                            </div>
                            <div>
                                {pic ? (
                                    <img src={pic} height={"300px"} loading='lazy' alt="Selected" onLoad={() => console.log('Image loaded')} />
                                ) : (
                                    <div>Loading...</div>
                                )}
                            </div>
                        </div>
                    </div>
                    <div className="modal-footer">
                        <button type="button" className="btn btn-secondary" data-bs-dismiss="modal" onClick={() => handleInvalidNukkad(data._id)}>Invalid</button>
                        <button type="button" className="btn btn-primary" onClick={() => handleVerifyNukkad(data._id)}>Verify</button>
                    </div>
                </div>
            </div>
        </div>
    );
}