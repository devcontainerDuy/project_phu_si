import React, { useEffect, useState } from "react";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import { Dropzone, FileMosaic } from "@dropzone-ui/react";
import { Notyf } from "notyf";
import axios from "axios";
import "notyf/notyf.min.css";
import Swal from 'sweetalert2'

function Gallery(props) {

    const {id}=props.id;
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
                color: "black",
                duration: 2000,
                dismissible: true,
            },
            {
                type: "info",
                background: "#24b3f0",
                color: "black",
                duration: 1500,
                dismissible: false,
                icon: '<i class="bi bi-bag-check"></i>',
            },
        ],
    });
    const [show, setShow] = useState(false);
    const [loading, setLoading] = useState(true);
    const [filesUpload, setFilesUpload] = React.useState([]);
    const handleClose = () => setShow(false);
    const [folders, setFolders] = useState([]);
    const [files, setFiles] = useState([]);
    const [idFolder, setIdFolder] = useState(null);
    useEffect(() => {
        setLoading(true);
        if (props.show && !idFolder) {
            setFiles([]);
            fetch("/api/folder")
                .then((res) => res.json())
                .then((res) => {
                    setLoading(false);
                    setFolders(res.data);
                });
        }
    }, [props.show, idFolder]);
    const updateFiles = (incommingFiles) => {
        setFilesUpload(incommingFiles);
    };
    const [filePath,setFilePath]= useState([]);

    const toggleFilePath = (filePathToAdd) => {
        if (filePath.includes(filePathToAdd)) {
            setFilePath((prevFilePath) =>
                prevFilePath.filter((path) => path !== filePathToAdd)
            );
        } else {
            setFilePath((prevFilePath) => [...prevFilePath, filePathToAdd]);
        }
        onFilepathsUpdate(filePath)
    };

    const deleteImage = (id) => {
        Swal.fire({
            icon: 'question',
            text: "Xóa hình ảnh này ?",
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: "Đúng",
            denyButtonText: `Không`
        }).then((result) => {
            if (result.isConfirmed) {
                axios.delete('/admin/files/' + id).then((res) => {
                    if (res.data.check == true) {
                        notyf.open({
                            type: "success",
                            message: "Đã xóa thành công",
                        });
                        setFiles(res.data.data);
                    }
                })
            } else if (result.isDenied) {
            }
        });
    }
    useEffect(() => {
        setLoading(true);
        if (idFolder != null) {
            fetch("/api/files/" + idFolder)
                .then((res) => res.json())
                .then((res) => {
                    setFiles(res.data);
                    setLoading(false);
                    setFolders([]);
                });
        }
    }, [idFolder]);
    const setUploadFiles = () => {
        setFilesUpload([]);
        setShow(true);
    };
    const uploadImage = () => {
        var formData = new FormData();
        filesUpload.forEach((file) => {
            formData.append("files[]", file.file);
        });
        if (idFolder != null) {
            formData.append("folder_id", idFolder);
        }
        axios
            .post("/admin/files/", formData)
            .then((res) => {
                if (res.data.check == true) {
                    notyf.open({
                        type: "success",
                        message: "Tải hình ảnh thành công",
                    });
                    setFilesUpload([]);
                    setShow(false);
                    fetch("/api/files/" + idFolder)
                        .then((res) => res.json())
                        .then((res) => {
                            setFiles(res.data);
                            setFolders([]);
                        });
                } else if (res.data.check == false) {
                    if (res.data.msg) {
                        notyf.open({
                            type: "error",
                            message: res.data.msg,
                        });
                    }
                }
            })
            .catch((error) => {});
    };
    return (
        <>
            <Modal
                show={show}
                onHide={handleClose}
                backdrop="static"
                aria-labelledby="contained-modal-title-vcenter"
                centered
                keyboard={false}
                size="md"
            >
                <Modal.Header closeButton>
                    <Modal.Title>Thêm hình ảnh</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Dropzone
                        onChange={updateFiles}
                        accept="image/*"
                        value={files}
                    >
                        {filesUpload.map((file) => (
                            <FileMosaic {...file} preview />
                        ))}
                    </Dropzone>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleClose}>
                        Đóng
                    </Button>
                    <Button variant="primary" onClick={(e) => uploadImage()}>
                        Tải hình
                    </Button>
                </Modal.Footer>
            </Modal>
            <Modal
                {...props}
                size="lg"
                aria-labelledby="contained-modal-title-vcenter"
                centered
            >
                <Modal.Header closeButton>
                    <Modal.Title id="contained-modal-title-vcenter">
                        Hình ảnh
                    </Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    {folders && folders.length > 0 && (
                        <div className="row mb-3">
                            <div
                                className="col-md-3"
                                style={{ cursor: "pointer" }}
                                onDoubleClick={(e) => setIdFolder(0)}
                            >
                                <div className="card">
                                    <div className="card-body">
                                        <img
                                            className="w-100"
                                            src="https://freesvg.org/img/blankBlueFolder.png"
                                            alt=""
                                        />
                                    </div>
                                    <div className="card-footer text-muted">
                                        Public
                                    </div>
                                </div>
                            </div>
                            {folders.map((folder, index) => (
                                <div
                                    className="col-md-3"
                                    style={{ cursor: "pointer" }}
                                    onDoubleClick={(e) =>
                                        setIdFolder(folder.id)
                                    }
                                >
                                    <div className="card">
                                        <div className="card-body">
                                            <img
                                                className="w-100"
                                                src="https://freesvg.org/img/blankBlueFolder.png"
                                                alt=""
                                            />
                                        </div>
                                        <div className="card-footer text-muted">
                                            {folder.name}
                                        </div>
                                    </div>
                                </div>
                            ))}
                        </div>
                    )}
                    <div className="row mb-3">
                        {loading && (
                            <img
                                style={{ width: "100px", margin: "0px auto" }}
                                src="https://www.icegif.com/wp-content/uploads/2023/07/icegif-1263.gif"
                                alt=""
                            />
                        )}
                        {files.length == 0 &&
                            folders.length == 0 &&
                            !loading && <b>Chưa có hình ảnh</b>}
                        {files && files.length > 0 && (
                            <>
                                {folders.map((folder, index) => (
                                    <div
                                        className="col-md-3 mb-3"
                                        style={{ cursor: "pointer" }}
                                        onDoubleClick={() =>
                                            setIdFolder(folder.id)
                                        }
                                        key={`folder-${index}`}
                                    >
                                        <div className="card">
                                            <div className="card-body">
                                                <img
                                                    className="w-100"
                                                    src="https://freesvg.org/img/blankBlueFolder.png"
                                                    alt=""
                                                />
                                            </div>
                                            <div className="card-footer text-muted">
                                                {folder.name}
                                            </div>
                                        </div>
                                    </div>
                                ))}

                                {files.length > 0 && (
                                    <div className="row">
                                        <div className="col-md-3 mb-3">
                                            <button
                                                className="btn btn-primary"
                                                onClick={(e) => {
                                                    setFiles([]);
                                                    setIdFolder(null);
                                                }}
                                            >
                                                Quay về
                                            </button>
                                        </div>
                                    </div>
                                )}

                                {files.map((file, index) => (
                                    <div
                                        className="col-md-3 mb-3"
                                        style={{ cursor: "pointer" }}
                                        key={`file-${index}`}
                                    >
                                        <div className="card">
                                            <div className="card-header text-center">
                                                <button className="btn btn-sm btn-danger"onClick={(e) => deleteImage(file.id)}>x</button>
                                            </div>
                                            <div className="card-body">
                                                <img
                                                    className="w-100"
                                                    onClick={() =>
                                                        toggleFilePath(
                                                            file.folder
                                                                ? `/storage/${file.folder.name}/${file.filename}`
                                                                : `/storage/${file.filename}`
                                                        )
                                                    }
                                                    src={
                                                        file.folder
                                                            ? "/storage/" +
                                                              file.folder.name +
                                                              "/" +
                                                              file.filename
                                                            : "/storage/" +
                                                              file.filename
                                                    }
                                                    alt=""
                                                />
                                            </div>
                                        </div>
                                    </div>
                                ))}
                            </>
                        )}
                    </div>
                </Modal.Body>
                <Modal.Footer>
                    <button
                        onClick={(e) => setUploadFiles()}
                        className="btn btn-warning"
                    >
                        <i class="bi bi-upload"></i>
                    </button>
                    <button
                        className="btn btn-secondary"
                        onClick={props.onHide}
                    >
                        Đóng
                    </button>
                </Modal.Footer>
            </Modal>
        </>
    );
}

export default Gallery;