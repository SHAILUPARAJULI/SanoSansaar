import React from "react";
import { Box, Button, Flex } from "@chakra-ui/react";
import { FaDog, FaUserAlt, FaCat } from "react-icons/fa";
import { FaRightFromBracket } from "react-icons/fa6";
import { NavLink } from "react-router-dom";

const AdminSidebar = () => {
  return (
    <Box w="20%" bg="#333" color="#fff" height="100vh">
      <Box p="4">
        <Flex direction="column" mt="8" spacing="4">
          <NavLink to="/adminHome">
            <Button as="div" variant="ghost">
              Users
            </Button>
          </NavLink>
          <NavLink to="/adminRequests">
            <Button as="div" variant="ghost">
              Requests
            </Button>
          </NavLink>
          <NavLink to="/adminDogs">
            <Button as="div" variant="ghost">
              Dog's Data
            </Button>
          </NavLink>
          <NavLink to="/adminCats">
            <Button as="div" variant="ghost">
              Cat's Data
            </Button>
          </NavLink>
          <NavLink to="/adminAddData">
            <Button as="div" variant="ghost">
              Add Data
            </Button>
          </NavLink>
        </Flex>
      </Box>
    </Box>
  );
};

export default AdminSidebar;
