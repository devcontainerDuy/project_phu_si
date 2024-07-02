import React, { useState } from "react";
import Layout from "../../components/Layout";
import { Notyf } from "notyf";
import 'notyf/notyf.min.css';
import axios from 'axios';
function CreateCategories({collections}) {
    const [category,setCategory]= useState('');
    const [position,setPosition]= useState(1);
    const [data,setData]=useState(collections);
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
        ],
    });

    const submitCollection=()=>{
        if(collection==''){
            notyf.open({
                type: "error",
                message: "Thiếu tên danh mục",
            });
        }else{
            axios.post('/admin/collections',{
                collection:collection,
                position:position
            }).then((res)=>{
                if(res.data.check==true){
                    notyf.open({
                        type: "success",
                        message: "Thêm thành công",
                    });
                    setCollection('');
                    setPosition('');
                }else if(res.data.check==false){
                    notyf.open({
                        type: "error",
                        message: res.data.msg,
                    });
                }
            })
        }
    }
    return (
        <Layout>
            <>
                <div className="row">
                    <div className="col-md- pt-5">
                        <div class="shadow p-3 mb-5 bg-body rounded card text-start">
                            <div class="card-body">
                                <div className="row">
                                    <a href="/admin/collections">Quay lại trang danh mục</a>

                                    <div className="col-md-4 mt-2">
                                        <div className="input-group mb-3">
                                            <span
                                                className="input-group-text"
                                                id="basic-addon1"
                                            >
                                                Danh mục sản phẩm
                                            </span>
                                            <input
                                                type="text"
                                                className="form-control"
                                                placeholder="Danh mục sản phẩm"
                                                value={collection}
                                                aria-label="Danh mục sản phẩm"
                                                onChange={(e)=>setCollection(e.target.value)}
                                                aria-describedby="basic-addon1"
                                            />
                                        </div>
                                    </div>
                                </div>

                                <div className="row">
                                    <div className="col-md-4">
                                        <div className="input-group mb-3">
                                            <span
                                                className="input-group-text"
                                                id="basic-addon2"
                                            >
                                                Thứ tự
                                            </span>
                                            <input
                                                type="number"
                                                className="form-control"
                                                placeholder="Thứ tự"
                                                value={position}
                                                onChange={(e)=>setPosition(e.target.value)}
                                                aria-label="Thứ tự"
                                                aria-describedby="basic-addon2"
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-md-3">
                                        <button className="btn btn-sm btn-outline-primary" onClick={(e)=>submitCollection()}>
                                            Thêm
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </>
        </Layout>
    );
}

export default CreateCategories;
