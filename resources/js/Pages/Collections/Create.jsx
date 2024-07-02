import React, { useState } from "react";
import Layout from "../../components/Layout";
function Create() {
    const [collection,setCollection]= useState('');
    const [position,setPosition]= useState(1);

    return (
        <Layout>
            <>
                <div className="row">
                    <div className="col-md- pt-5">
                        <div class="shadow p-3 mb-5 bg-body rounded card text-start">
                            <div class="card-body">
                                <div className="row">
                                    <div className="col-md-4">
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
                                        <button className="btn btn-sm btn-outline-primary">
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

export default Create;
