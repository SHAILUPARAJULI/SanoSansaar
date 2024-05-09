import React from "react";
import { Box, Flex } from "@chakra-ui/react";
import { Routes, Route } from "react-router-dom"; // Import Routes from react-router-dom
import AdminSidebar from "./AdminSidebar";
import UserCard from "./UserCard"; // Assuming AdminUsers is exported as UserCard
import DogsCard from "./DogsCard"; // Assuming AdminDogs is exported as DogsCard
import CatsCard from "./CatsCard"; // Assuming AdminCats is exported as CatsCard
import Contribute from "./Contribute"; // Assuming AdminAddData is exported as Contribute

const AdminHomePage = () => {
  return (
    <Flex>
      <AdminSidebar />
      <Box flex="1" p="8">
        <Routes>
          {" "}
          {/* Wrap Routes around Route components */}
          <Route path="/adminHome" element={<UserCard />} />{" "}
          {/* Use element prop instead of component */}
          {/* <Route path="/adminRequests" component={AdminRequests} /> */}
          <Route path="/adminDogs" element={<DogsCard />} />{" "}
          {/* Use element prop instead of component */}
          <Route path="/adminCats" element={<CatsCard />} />{" "}
          {/* Use element prop instead of component */}
          <Route path="/adminAddData" element={<Contribute />} />{" "}
          {/* Use element prop instead of component */}
        </Routes>
      </Box>
    </Flex>
  );
};

export default AdminHomePage;
