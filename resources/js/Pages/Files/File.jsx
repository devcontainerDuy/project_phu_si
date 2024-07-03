import React, { useEffect, useState } from "react";
import Layout from "../../components/Layout";
import PropTypes from "prop-types";
import clsx from "clsx";
import { styled, css } from "@mui/system";
import { Modal as BaseModal } from "@mui/base/Modal";
import { Notyf } from "notyf";
import "notyf/notyf.min.css";
import axios from "axios";
function File({ folders }) {
    const [open, setOpen] = React.useState(false);
    const handleOpen = () => setOpen(true);
    const handleClose = () => setOpen(false);
    const [folder, setFolder] = useState("");
    const [images, setImages] = useState([]);
    const [data, setFolders] = useState(folders);
    const [idfolder, setIdFolder] = useState(0);
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
    const submitFolder = () => {
        if (folder == "") {
            notyf.open({
                type: "error",
                message: "Vui lòng nhập tên thư mục",
            });
        } else {
            axios
                .post("/admin/folder", {
                    name: folder,
                })
                .then((res) => {
                    if (res.data.check == true) {
                        setFolders(res.data.data);
                        notyf.open({
                            type: "success",
                            message: "Tạo thư mục thành công",
                        });
                        closeCreateFolder();
                    }
                });
        }
    };
    const closeCreateFolder = () => {
        setFolder("");
        setOpen(false);
    };
    const resetCreateFolder = () => {
        setFolder("");
        setOpen(true);
    };
    useEffect(() => {
        if (idfolder != 0) {
            axios.get("/admin/files/" + idfolder).then((res) => {
                setImages(res.data.data);
            });
        }
    }, [idfolder]);
    return (
        <Layout>
            <>
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
                        <Modal
                            aria-labelledby="unstyled-modal-title"
                            aria-describedby="unstyled-modal-description"
                            open={open}
                            onClose={handleClose}
                            slots={{ backdrop: StyledBackdrop }}
                        >
                            <ModalContent sx={{ width: 400 }}>
                                <div className="input-group mb-3">
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Tên thư mục ..."
                                        aria-label="Tên thư mục ..."
                                        aria-describedby="button-addon2"
                                        onChange={(e) =>
                                            setFolder(e.target.value)
                                        }
                                    />
                                    <button
                                        className="btn btn-outline-primary"
                                        type="button"
                                        id="button-addon2"
                                        onClick={(e) => submitFolder()}
                                    >
                                        Thêm
                                    </button>
                                </div>
                            </ModalContent>
                        </Modal>
                        <div
                            className="collapse navbar-collapse"
                            id="navbarSupportedContent"
                        >
                            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                                <li className="nav-item">
                                    <a
                                        className="nav-link active"
                                        aria-current="page"
                                        href="#"
                                        onClick={(e) => resetCreateFolder()}
                                    >
                                        Thêm thư mục
                                    </a>
                                </li>
                                <li className="nav-item">
                                    <a
                                        className="nav-link active"
                                        aria-current="page"
                                        href="#"
                                        onClick={(e) => resetCreateFolder()}
                                    >
                                        Up hình ảnh
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div className="row">
                    <div className="col-md-3">
                        <div className="row mt-3">
                            <div className="col-md">
                                <ul className="list-group">
                                    <li
                                        style={{ cursor: "pointer" }}
                                        className={
                                            idfolder == 0
                                                ? "list-group-item active"
                                                : "list-group-item"
                                        }
                                    >
                                        public
                                    </li>
                                    {folders.length > 0 &&
                                        folders.map((folder, index) => (
                                            <li
                                                style={{ cursor: "pointer" }}
                                                onClick={(e) =>
                                                    setIdFolder(folder.id)
                                                }
                                                className={
                                                    idfolder == folder.id
                                                        ? "list-group-item active"
                                                        : "list-group-item"
                                                }
                                            >
                                                {folder.name}
                                            </li>
                                        ))}
                                </ul>
                            </div>
                        </div>
                    </div>
                    {}
                    <div className="col-md mt-3">
                        <div class="card text-start">
                            <div class="card-body">
                                {images.length == 0 && (
                                    <h5>Chưa có hình ảnh</h5>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            </>
        </Layout>
    );
}
const Backdrop = React.forwardRef((props, ref) => {
    const { open, className, ...other } = props;
    return (
        <div
            className={clsx({ "base-Backdrop-open": open }, className)}
            ref={ref}
            {...other}
        />
    );
});

Backdrop.propTypes = {
    className: PropTypes.string.isRequired,
    open: PropTypes.bool,
};

const blue = {
    200: "#99CCFF",
    300: "#66B2FF",
    400: "#3399FF",
    500: "#007FFF",
    600: "#0072E5",
    700: "#0066CC",
};

const grey = {
    50: "#F3F6F9",
    100: "#E5EAF2",
    200: "#DAE2ED",
    300: "#C7D0DD",
    400: "#B0B8C4",
    500: "#9DA8B7",
    600: "#6B7A90",
    700: "#434D5B",
    800: "#303740",
    900: "#1C2025",
};

const Modal = styled(BaseModal)`
    position: fixed;
    z-index: 1300;
    inset: 0;
    display: flex;
    align-items: center;
    justify-content: center;
`;

const StyledBackdrop = styled(Backdrop)`
    z-index: -1;
    position: fixed;
    inset: 0;
    background-color: rgb(0 0 0 / 0.5);
    -webkit-tap-highlight-color: transparent;
`;

const ModalContent = styled("div")(
    ({ theme }) => css`
        font-family: "IBM Plex Sans", sans-serif;
        font-weight: 500;
        text-align: start;
        position: relative;
        display: flex;
        flex-direction: column;
        gap: 8px;
        overflow: hidden;
        background-color: ${theme.palette.mode === "dark" ? grey[900] : "#fff"};
        border-radius: 8px;
        border: 1px solid
            ${theme.palette.mode === "dark" ? grey[700] : grey[200]};
        box-shadow: 0 4px 12px
            ${theme.palette.mode === "dark"
                ? "rgb(0 0 0 / 0.5)"
                : "rgb(0 0 0 / 0.2)"};
        padding: 24px;
        color: ${theme.palette.mode === "dark" ? grey[50] : grey[900]};

        & .modal-title {
            margin: 0;
            line-height: 1.5rem;
            margin-bottom: 8px;
        }

        & .modal-description {
            margin: 0;
            line-height: 1.5rem;
            font-weight: 400;
            color: ${theme.palette.mode === "dark" ? grey[400] : grey[800]};
            margin-bottom: 4px;
        }
    `
);

const TriggerButton = styled("button")(
    ({ theme }) => css`
        font-family: "IBM Plex Sans", sans-serif;
        font-weight: 600;
        font-size: 0.875rem;
        line-height: 1.5;
        padding: 8px 16px;
        border-radius: 8px;
        transition: all 150ms ease;
        cursor: pointer;
        background: ${theme.palette.mode === "dark" ? grey[900] : "#fff"};
        border: 1px solid
            ${theme.palette.mode === "dark" ? grey[700] : grey[200]};
        color: ${theme.palette.mode === "dark" ? grey[200] : grey[900]};
        box-shadow: 0 1px 2px 0 rgb(0 0 0 / 0.05);

        &:hover {
            background: ${theme.palette.mode === "dark" ? grey[800] : grey[50]};
            border-color: ${theme.palette.mode === "dark"
                ? grey[600]
                : grey[300]};
        }

        &:active {
            background: ${theme.palette.mode === "dark"
                ? grey[700]
                : grey[100]};
        }

        &:focus-visible {
            box-shadow: 0 0 0 4px
                ${theme.palette.mode === "dark" ? blue[300] : blue[200]};
            outline: none;
        }
    `
);
export default File;
