import React, { useState, useEffect } from "react";
import Layout from "../../components/Layout";
import { Container, Row, Col, Button, Modal, Form, Image } from "react-bootstrap";
import { Box, Select, Switch, Typography, MenuItem, InputLabel, FormControl } from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import { Notyf } from "notyf";
import "notyf/notyf.min.css";
import axios from "axios";
import CKEditor from "../../components/CKEditor";

export default function Post({ posts, categorys }) {
	const [data, setData] = useState("");
	const [categories, setCategories] = useState("");
	const [show, setShow] = useState(false);

	const handleClose = () => setShow(false);
	const handleShow = () => setShow(true);

	useEffect(() => {
		setData(posts);
		setCategories(categorys);
	}, [posts, categorys]);

	const formatCreatedAt = (dateString) => {
		const date = new Date(dateString);
		return date.toLocaleString();
	};

	// =================={Create}=======================
	const [title, setTitle] = useState("");
	const [summary, setSummary] = useState("");
	const [collection, setCollection] = useState("");
	const [category, setCategory] = useState("");
	const [position, setPosition] = useState(0);
	const [content, setContent] = useState("");
	const [status, setStatus] = useState(false);
	const [highlighted, setHighlighted] = useState(false);

	const resetCreate = () => {
		setTitle("");
		setSummary("");
		setCollection("");
		setCategory("");
		setContent("");
		setStatus(false);
		setHighlighted(false);
		handleClose();
	};

	const handleCreate = () => {
		axios
			.post("/admin/posts", {
				title: title,
				summary: summary,
				id_collection: collection,
				id_category: Number(category),
				position: position,
				content: content,
				status: status,
				highlighted: highlighted,
			})
			.then((response) => {
				if (response.data.check === true) {
					notyf.open({ type: "success", message: response.data.msg });
					setData(response.data.data);
					resetCreate();
				} else {
					notyf.open({ type: "error", message: response.data.msg });
				}
			});
	};

	const handleCellEditStop = (id, field, value) => {
		console.log(id, field, value);
		axios
			.put(`/admin/posts/${id}`, {
				[field]: value,
			})
			.then((response) => {
				if (response.data.check === true) {
					notyf.open({ type: "success", message: response.data.msg });
					setData(response.data.data);
				} else {
					notyf.open({ type: "error", message: response.data.msg });
				}
			});
	};

	const deletePost = (id) => {
		axios
			.delete(`/admin/posts/${id}`)
			.then((response) => {
				if (response.data.check === true) {
					notyf.open({ type: "success", message: response.data.msg });
					setData(response.data.data);
				} else {
					notyf.open({ type: "error", message: response.data.msg });
				}
			})
			.catch((error) => {
				notyf.open({ type: "error", message: error.response.data.msg });
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
		{ field: "id", headerName: "#", width: 30 },
		{ field: "title", headerName: "Tiêu đề bài viết", width: 240, editable: true },
		{ field: "slug", headerName: "Slug", width: 160 },
		{ field: "id_collection", headerName: "Danh mục", width: 140, editable: true },
		{
			field: "id_category",
			headerName: "Chuyên mục",
			width: 140,
			editable: true,
			renderCell: (params) => (
				<Select variant="standard" value={params.value} className="w-100" onChange={(e) => handleCellEditStop(params.id, params.field, e.target.value)}>
					{categories && categories.length > 0 ? (
						categories.map((item) => (
							<MenuItem key={item.id} value={item.id}>
								{item.title}
							</MenuItem>
						))
					) : (
						<MenuItem disabled>Không có chuyên mục</MenuItem>
					)}
				</Select>
			),
		},
		{
			field: "status",
			headerName: "Trạng thái",
			width: 100,
			editable: true,
			renderCell: (params) => (
				<Switch checked={params.value == 1} onChange={(e) => handleCellEditStop(params.id, params.field, e.target.checked ? 1 : 0)} inputProps={{ "aria-label": "controlled" }} />
			),
		},
		{
			field: "highlighted",
			headerName: "Highlighted",
			width: 100,
			editable: true,
			renderCell: (params) => (
				<Switch checked={params.value == 1} onChange={(e) => handleCellEditStop(params.id, params.field, e.target.checked ? 1 : 0)} inputProps={{ "aria-label": "controlled" }} />
			),
		},
		{ field: "view", headerName: "Lượt xem", width: 100 },
		{ field: "created_at", headerName: "Ngày tạo", width: 140, valueGetter: (params) => formatCreatedAt(params) },
		{ field: "updated_at", headerName: "Ngày cập nhật", width: 140, valueGetter: (params) => formatCreatedAt(params) },
		{
			field: "action",
			headerName: "Thao tác",
			renderCell: (params) => {
				return (
					<Button
						variant="danger"
						onClick={() => {
							deletePost(params.row.id);
						}}>
						Xóa
					</Button>
				);
			},
			width: 200,
		},
	];

	return (
		<Layout>
			<>
				<Row>
					<Col>
						<Button variant="primary" onClick={handleShow}>
							Thêm bài viết mới
						</Button>

						<Modal show={show} onHide={resetCreate} backdrop="static" size="lg" centered keyboard={false}>
							<Form
								encType="multipart/form-data"
								onSubmit={(e) => {
									e.preventDefault();
									handleCreate();
								}}>
								<Modal.Header closeButton>
									<Modal.Title> Tạo bài viết</Modal.Title>
								</Modal.Header>
								<Modal.Body aria-modal="true" role="dialog" tabIndex={-1} scroll="body">
									<Row>
										<Col sm={12} md={6} lg={6}>
											<Form.Group className="mb-3" controlId="formGroupTitle">
												<Form.Label>
													<strong>Tiêu đề</strong>{" "}
												</Form.Label>
												<Form.Control type="text" placeholder="Nhập tiêu đề bài viết..." value={title} onChange={(e) => setTitle(e.target.value)} />
											</Form.Group>
										</Col>
										<Col sm={12} md={6} lg={6}>
											<Form.Group className="mb-3" controlId="formGroupSummary">
												<Form.Label>
													<strong>Mô tả </strong>{" "}
												</Form.Label>
												<Form.Control type="text" placeholder="Nhập mô tả ngắn..." value={summary} onChange={(e) => setSummary(e.target.value)} />
											</Form.Group>
										</Col>
										<Col sm={12} md={5} lg={4}>
											<Form.Group className="mb-3" controlId="formGroupCollection">
												<Form.Label>
													<strong>Doanh mục chính</strong>
												</Form.Label>
												<Form.Select value={collection} onChange={(e) => setCollection(e.target.value)}>
													<option>Tính năng chưa được phát triển ¯\_( ͡° ͜ʖ ͡°)_/¯</option>
												</Form.Select>
											</Form.Group>
										</Col>
										<Col sm={12} md={5} lg={5}>
											<Form.Group className="mb-3" controlId="formGroupCategory">
												<Form.Label>
													<strong>Chuyên mục</strong>
												</Form.Label>
												<Form.Select value={category} onChange={(e) => setCategory(e.target.value)}>
													<option value="">Chọn 1 chuyên mục</option>
													{categories.length > 0 &&
														categories.map((category) => (
															<option key={category.id} value={category.id}>
																{category.title}
															</option>
														))}
												</Form.Select>
											</Form.Group>
										</Col>
										<Col sm={12} md={2} lg={3}>
											<Form.Group className="mb-3" controlId="formGroupPosition">
												<Form.Label>
													<strong>Vị trí</strong>
												</Form.Label>
												<Form.Control type="number" placeholder="Nhập vị trí bài viết..." value={position} onChange={(e) => setPosition(e.target.value)} />
											</Form.Group>
										</Col>
										<Col xs={12}>
											<Form.Group className="mb-3" controlId="formGroupContent">
												<Form.Label>
													<strong>Nội dung</strong>{" "}
												</Form.Label>
												<CKEditor value={content} onBlur={setContent} />
											</Form.Group>
										</Col>
										<Col xs={3}>
											<Form.Check type="switch" id="custom-switch-status" label="Trạng thái bài viết" checked={status === 1} onChange={(e) => setStatus(e.target.checked ? 1 : 0)} />
										</Col>
										<Col xs={3}>
											<Form.Check type="switch" id="custom-switch-highlight" label="Highlighted" checked={highlighted === 1} onChange={(e) => setHighlighted(e.target.checked ? 1 : 0)} />
										</Col>
									</Row>
								</Modal.Body>
								<Modal.Footer>
									<Button variant="secondary" onClick={resetCreate}>
										Thoát
									</Button>
									<Button variant="primary" type="submit">
										Lưu lại
									</Button>
								</Modal.Footer>
							</Form>
						</Modal>
					</Col>
				</Row>
				<Row>
					{data && (
						<Col className="mt-3">
							<Box sx={{ height: 400, width: "100%" }}>
								<DataGrid
									rows={data}
									columns={columns}
									pageSize={5}
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
						</Col>
					)}
				</Row>
			</>
		</Layout>
	);
}
