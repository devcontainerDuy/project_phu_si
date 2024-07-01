import React, { useState } from "react";
import Layout from "../../components/Layout";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import { Box, Typography } from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import { Notyf } from "notyf";
import "notyf/notyf.min.css";
import axios from "axios";
function Users({ users, roles }) {
    const [create, setCreate] = useState(true);
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [fullName, setFullName] = useState("");
    const [idRole, setIdRole] = useState(0);
    const [show, setShow] = useState(false);
    const handleClose = () => setShow(false);
    const notyf = new Notyf({
        duration: 1000,
        position: {
            x: "right",
            y: "top",
        },
        types: [
            {
                type: "warning",
                background: "orange",
                icon: {
                    className: "material-icons",
                    tagName: "i",
                    text: "warning",
                },
            },
            {
                type: "error",
                background: "indianred",
                duration: 2000,
                dismissible: true,
            },
            {
                type: "success",
                background: "green",
                color: "white",
                duration: 2000,
                dismissible: true,
            },
            {
                type: "info",
                background: "#24b3f0",
                color: "white",
                duration: 1500,
                dismissible: false,
                icon: '<i class="bi bi-bag-check"></i>',
            },
        ],
    });
    const resetCreate = () => {
        setIdRole(0);
        setEmail("");
        setName("");
        setFullName('');
        setShow(true);
    };
    const submitUser =()=>{
        if(name==''){
            notyf.open({
                type: "error",
                message: "Vui lòng nhập tên tài khoản",
              });
        }else if(email==''){
            notyf.open({
                type: "error",
                message: "Vui lòng nhập email",
              });
        }else if(fullName==''){
            notyf.open({
                type: "error",
                message: "Vui lòng nhập họ tên",
              });
        }else if(idRole==0){
            notyf.open({
                type: "error",
                message: "Vui lòng chọn loại tài khoản",
              });
        }else{
            axios.post('/admin/users',{
                name:name,
                email:email,
                fullName:fullName,
                idRole:idRole
            }).then((res)=>{
                if(res.data.check==true){
                    notyf.open({
                        type: "success",
                        message: "Đã tạo tài khoản",
                      });
                      resetCreate();
                }else if(res.data.check==false){
                    if(res.data.msg){
                        notyf.open({
                            type: "error",
                            message: res.data.msg,
                          });
                    }
                }
            })
        }
    }
    return (
        <Layout>
            <>
                <Modal show={show} onHide={handleClose}>
                    <Modal.Header closeButton>
                        <Modal.Title>Tạo tài khoản</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <div className="input-group mb-3">
                            <span
                                className="input-group-text"
                                id="basic-addon1"
                            >
                                Username
                            </span>
                            <input
                                type="text"
                                className="form-control"
                                placeholder="Username"
                                aria-label="Username"
                                aria-describedby="basic-addon1"
                                onChange={(e)=>setName(e.target.value)}
                            />
                        </div>
                        <div className="input-group mb-3">
                            <span
                                className="input-group-text"
                                id="basic-addon2"
                            >
                                Email
                            </span>
                            <input
                                type="text"
                                className="form-control"
                                placeholder="Email"
                                aria-label="Email"
                                aria-describedby="basic-addon2"
                                onChange={(e)=>setEmail(e.target.value)}
                            />
                        </div>
                        <div className="input-group mb-3">
                            <span
                                className="input-group-text"
                                id="basic-addon3"
                            >
                                Họ tên
                            </span>
                            <input
                                type="text"
                                className="form-control"
                                placeholder="Họ tên"
                                aria-label="Họ tên"
                                aria-describedby="basic-addon3"
                                onChange={(e)=>setFullName(e.target.value)}
                            />
                        </div>
                        <div className="input-group mb-3">
                            <span
                                className="input-group-text"
                                id="basic-addon4"
                            >
                                Loại tài khoản
                            </span>
                            <select name="" id="" defaultValue={0} onChange={(e)=>setIdRole(e.target.value)} className="form-control">
                                <option value={0} disabled>Chọn loại tài khoản</option>
                                {roles.length>0 && roles.map((item,index)=>(
                                    <option key={index} value={item.id}>{item.name}</option>
                                ))}
                            </select>
                        </div>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" onClick={handleClose}>
                            Đóng
                        </Button>
                        <Button variant="primary" onClick={(e) => submitUser()}>
                            Tạo mới
                        </Button>
                    </Modal.Footer>
                </Modal>
                <nav className="navbar navbar-expand-lg navbar-light bg-light">
                    <div className="container-fluid">
                        <button
                            className="navbar-toggler"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent"
                            aria-expanded="false"
                            aria-label="Toggle navigation"
                        >
                            <span className="navbar-toggler-icon" />
                        </button>
                        <div
                            className="collapse navbar-collapse"
                            id="navbarSupportedContent"
                        >
                            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                                <li className="nav-item">
                                    <a
                                        className="btn btn-primary"
                                        onClick={(e) => resetCreate()}
                                        aria-current="page"
                                        href="#"
                                    >
                                        Tạo mới
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </>
        </Layout>
    );
}

export default Users;
