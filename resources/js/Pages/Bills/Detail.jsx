import React from 'react'
import Layout from '../../components/Layout'

function Detail({ total,bill, billList }) {
    return (
        <Layout>
            <>
                .<div class="card">
                    <div class="card-header">
                        <h4>Hóa đơn chi tiết</h4>
                    </div>
                    <div class="card-body">
                        <div className="row">
                            <div className="col-md-9">
                                <h5>Tên khách hàng : {bill.name}</h5>
                                <h5>Số điện thoại : {bill.phone}</h5>
                                <h5>Địa chỉ đặt hàng : {bill.address}</h5>
                                {bill.note && (
                                    <>
                                        <h5>Ghi chú :</h5>
                                        {bill.note}
                                    </>
                                )}

                                <hr />
                                <div className="row">
                                    <h4>Chi tiết hóa đơn</h4>
                                    <div
                                        class="table-responsive"
                                    >
                                        <table
                                            class="table table-striped"
                                        >
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Tên sản phẩm</th>
                                                    <th scope="col">Đơn giá</th>
                                                    <th scope="col">Số lượng</th>
                                                    <th scope="col">Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            {billList.map((item, index) => (
                                                    <tr key={index}>
                                                        <td><img style={{width:'250px'}} src={item.product.image.image} alt="" /></td>
                                                        <td>{item.product.name}</td>
                                                        <td>{Intl.NumberFormat("en-US").format(item.product.price)}</td>
                                                        <td>{item.quantity}</td>
                                                        <td>{Intl.NumberFormat("en-US").format(item.product.price*item.quantity)}</td>
                                                    </tr>
                                                ))}
                                            <tr>
                                                <td colSpan={4}>Thành tiền</td>
                                                <td>{Intl.NumberFormat("en-US").format(total)}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <div className="col-md">

                            </div>
                        </div>
                    </div>
                </div>

            </>

        </Layout>

    )
}

export default Detail