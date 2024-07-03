/* eslint-disable */
import React from 'react'
import { Sidebar, Menu, MenuItem, useProSidebar, SubMenu } from "react-pro-sidebar";
import MenuOutlinedIcon from "@mui/icons-material/MenuOutlined";
import GroupIcon from '@mui/icons-material/Group';
import PinterestIcon from '@mui/icons-material/Pinterest';
import BrandingWatermarkIcon from '@mui/icons-material/BrandingWatermark';
import InventoryIcon from '@mui/icons-material/Inventory';
import LogoutIcon from '@mui/icons-material/Logout';
import CardTravelIcon from '@mui/icons-material/CardTravel';
import ShopIcon from '@mui/icons-material/Shop';
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';
import DesignServicesTwoToneIcon from '@mui/icons-material/DesignServicesTwoTone';
import "../../css/app.css";
function Layout({ children }) {
  const { collapseSidebar } = useProSidebar();
  return (
    <>
      <div className='row w-100'>
      </div>
      <div style={({ height: "90vh" }, { display: "flex" })}>
        <Sidebar style={{ minHeight: "90vh" }}>
          <Menu>
            <MenuItem
              icon={<MenuOutlinedIcon />}
              onClick={() => {
                collapseSidebar();
              }}
              style={{ textAlign: "center" }}
            >
              {" "}
              <h2>Admin</h2>
            </MenuItem>
            <SubMenu label="Tài khoản" icon={<GroupIcon />}>
            <a href={'/admin/permissions'}> <MenuItem icon={<GroupIcon />}>Quyền tài khoản</MenuItem></a>
           <a href={'/admin/roles'}> <MenuItem icon={<GroupIcon />}>Loại tài khoản</MenuItem></a>
           <a href={'/admin/users'}> <MenuItem icon={<GroupIcon />}>Tài khoản</MenuItem></a>
            </SubMenu>
            <SubMenu label="Quản lý sản phẩm" icon={<BrandingWatermarkIcon />}>
            <SubMenu label="Danh mục" icon={<ArrowForwardIosIcon />}>
            <a href={'/admin/collections'}> <MenuItem icon={<ArrowForwardIosIcon />}>Danh mục</MenuItem></a>
            <a href={'/admin/collections/create'}> <MenuItem icon={<ArrowForwardIosIcon />}>Thêm danh mục</MenuItem></a>
            <a href={'/admin/categories/create'}> <MenuItem icon={<ArrowForwardIosIcon />}>Tạo Danh mục con</MenuItem></a>
            <a href={'/admin/categories'}> <MenuItem icon={<ArrowForwardIosIcon />}>Danh mục con </MenuItem></a>

            </SubMenu>
            <a href={'/admin/brands'}> <MenuItem icon={<PinterestIcon />}>Thương hiệu</MenuItem></a>
            <a href={'/products'}> <MenuItem icon={<InventoryIcon />}>Sản phẩm</MenuItem></a>
            </SubMenu>
           <a href={'/slides'}> <MenuItem icon={<ShopIcon />}>Slides</MenuItem></a>
           <a href={'/bills'}> <MenuItem icon={<CardTravelIcon />}>Hoá đơn</MenuItem></a>
           <a href={'/services'}> <MenuItem icon={<DesignServicesTwoToneIcon />}>Dịch vụ </MenuItem></a>
           <a href={'/logout'}> <MenuItem icon={<LogoutIcon />}>Log out</MenuItem></a>

{/*
            <MenuItem icon={<ReceiptOutlinedIcon />}>Profile</MenuItem>
            <MenuItem icon={<HelpOutlineOutlinedIcon />}>FAQ</MenuItem>
            <MenuItem icon={<CalendarTodayOutlinedIcon />}>Calendar</MenuItem> */}
          </Menu>
        </Sidebar>
        <main className='p-4 w-100'>
          {children}
        </main>
      </div>

    </>
  )
}

export default Layout
