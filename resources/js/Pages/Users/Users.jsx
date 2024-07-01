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
        setShow(true);
    };
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
                                @
                            </span>
                            <input
                                type="text"
                                className="form-control"
                                placeholder="Username"
                                aria-label="Username"
                                aria-describedby="basic-addon1"
                            />
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
