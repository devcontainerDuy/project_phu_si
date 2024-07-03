import React, { useState, useEffect } from "react";
import Layout from "../../components/Layout";
import { Container, Row, Col, Button, Modal, Form } from "react-bootstrap";
import { Box, Select, Switch, Typography } from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import { Notyf } from "notyf";
import "notyf/notyf.min.css";
import axios from "axios";

export default function Slides({ slides }) {
	const [data, setData] = useState([]);
	const [show, setShow] = useState(false);

	const handleClose = () => setShow(false);
	const handleShow = (id) => {
		setShow(true);
		axios.get(`/admin/slides/${id}`).then((response) => {
			if (response.data.check === true) {
				setName(response.data.data.name);
				setFileDesktop(response.data.data.desktop);
				setFileMobile(response.data.data.mobile);
				setUrl(response.data.data.url);
			} else {
				notyf.error(response.data.msg);
			}
		});
	};

	useEffect(() => {
		setData(slides);
	}, [slides]);

	//=================={Create}=======================
	const [name, setName] = useState("");
	const [fileDesktop, setFileDesktop] = useState(null);
	const [fileMobile, setFileMobile] = useState(null);
	const [url, setUrl] = useState("");

	const resetCreate = () => {
		setName("");
		setFileDesktop(null);
		setFileMobile(null);
		setUrl("");
		handleClose();
	};

	const handleSubmit = () => {
		const formData = new FormData();
		formData.append("name", name);
		formData.append("desktop", fileDesktop);
		formData.append("mobile", fileMobile);
		formData.append("url", url);

		axios
			.post("/admin/slides", formData)
			.then((response) => {
				if (response.data.check === true) {
					notyf.success(response.data.msg);
					resetCreate();
					setData(response.data.data);
				} else {
					notyf.error(response.data.msg);
				}
			})
			.catch((error) => {
				notyf.error(error.response.data.msg);
			});
	};

	const handleCellEditStop = (id, field, value) => {
		axios.put(`/admin/slides/${id}`, { [field]: value }).then((response) => {
			if (response.data.check === true) {
				notyf.open({
					type: "success",
					message: response.data.msg,
				});
				setData(response.data.data);
			} else {
				notyf.open({
					type: "error",
					message: response.data.msg,
				});
			}
		});
	};

	const handleDelete = (id) => {
		axios
			.delete(`/admin/slides/${id}`)
			.then((response) => {
				if (response.data.check === true) {
					notyf.open({
						type: "success",
						message: response.data.msg,
					});
					setData(response.data.data);
				} else {
					notyf.open({
						type: "error",
						message: response.data.msg,
					});
				}
			})
			.catch((error) => {
				notyf.open({
					type: "error",
					message: error.response.data.msg,
				});
			});
	};

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
				background: "#7dd3e8",
				duration: 2000,
				dismissible: true,
			},
		],
	});

	const columns = [
		{ field: "id", headerName: "#", width: 90 },
		{
			field: "name",
			headerName: "Tên slide",
			width: 230,
			editable: true,
		},
		{
			field: "slug",
			headerName: "Slug",
			width: 230,
			editable: true,
		},
		{
			field: "status",
			headerName: "Trạng thái",
			type: "number",
			width: 150,
			editable: true,
			renderCell: (params) => (
				<Switch checked={params.value == 1} onChange={(e) => handleCellEditStop(params.id, params.field, e.target.checked ? 1 : 0)} inputProps={{ "aria-label": "controlled" }} />
			),
		},
		{
			field: "actions",
			headerName: "Thao tác",
			sortable: false,
			width: 260,
			type: "actions",
			getActions: (params) => [
				<Button variant="warning" onClick={() => handleShow(params.row.id)}>
					<i className="bi bi-pencil-square" />
				</Button>,

				<Button className="ms-2" variant="danger" onClick={() => handleDelete(params.row.id)}>
					<i className="bi bi-trash" />
				</Button>,
			],
		},
	];

	return (
		<Layout>
			<>
				<h1>Slides</h1>
				<Modal show={show} onHide={resetCreate} backdrop="static" keyboard={false}>
					<Modal.Header closeButton>
						<Modal.Title>Chi tiết slide</Modal.Title>
					</Modal.Header>
					<Modal.Body>
						<Form encType="multipart/form-data">
							<Form.Group className="mb-3" controlId="ControlInput1">
								<Form.Label>Tên slide</Form.Label>
								<Form.Control type="text" placeholder="Nhập tên slide" value={name} autoFocus />
							</Form.Group>
							<Form.Group className="mb-3" controlId="ControlInput2">
								<Form.Label>Desktop</Form.Label>

								<Form.Control type="file" placeholder="Nhập mẫu desktop" multiple />
							</Form.Group>
							<Form.Group className="mb-3" controlId="ControlInput3">
								<Form.Label>Mobile</Form.Label>
								<Form.Control type="file" placeholder="Nhập mẫu mobile" multiple />
							</Form.Group>
							<Form.Group className="mb-3" controlId="ControlInput4">
								<Form.Label>URL</Form.Label>
								<Form.Control type="text" placeholder="Nhập đường dẫn slide" autoFocus />
							</Form.Group>
						</Form>
					</Modal.Body>
					<Modal.Footer>
						<Button variant="secondary" onClick={handleClose}>
							Thoát
						</Button>
						<Button variant="primary" onClick={handleClose}>
							Lưu lại
						</Button>
					</Modal.Footer>
				</Modal>

				<Row>
					<Col xs lg={4}>
						<Form
							className="shadow p-3 mb-5 bg-white rounded"
							encType="multipart/form-data"
							onSubmit={(e) => {
								e.preventDefault();
								handleSubmit();
							}}>
							<Form.Group className="mb-3" controlId="ControlInput1">
								<Form.Label>Tên slide</Form.Label>
								<Form.Control type="text" placeholder="Nhập tên slide" value={name} autoFocus onChange={(e) => setName(e.target.value)} />
							</Form.Group>
							<Form.Group className="mb-3" controlId="ControlInput2">
								<Form.Label>Desktop</Form.Label>
								<Form.Control type="file" placeholder="Nhập mẫu desktop" onChange={(e) => setFileDesktop(e.target.files[0])} />
							</Form.Group>
							<Form.Group className="mb-3" controlId="ControlInput3">
								<Form.Label>Mobile</Form.Label>
								<Form.Control type="file" placeholder="Nhập mẫu mobile" onChange={(e) => setFileMobile(e.target.files[0])} />
							</Form.Group>
							<Form.Group className="mb-3" controlId="ControlInput4">
								<Form.Label>URL</Form.Label>
								<Form.Control type="text" placeholder="Nhập đường dẫn slide" value={url} autoFocus onChange={(e) => setUrl(e.target.value)} />
							</Form.Group>
							<Col as={"div"}>
								<Button variant="success" type="submit" className="w-100">
									Lưu lại
								</Button>
							</Col>
						</Form>
					</Col>
					<Col>
						{data && (
							<Box sx={{ height: 400, width: "100%" }}>
								<DataGrid
									rows={data}
									columns={columns}
									initialState={{
										pagination: {
											paginationModel: {
												pageSize: 5,
											},
										},
									}}
									pageSizeOptions={[5]}
									checkboxSelection
									disableRowSelectionOnClick
									onCellEditStop={(params, e) => handleCellEditStop(params.row.id, params.field, e.target.value)}
								/>
							</Box>
						)}
					</Col>
				</Row>
			</>
		</Layout>
	);
}
