import { Box, Button, Text } from "@chakra-ui/react";
import React from "react";

const UserCard = ({ name, email, location, gender, _id, handleBlockUser }) => {
  return (
    <div>
      <Box
        padding={"20px"}
        boxShadow={"rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;"}
      >
        <Text>
          {" "}
          <span style={{ fontWeight: "bold" }}> Name :- </span> {name}{" "}
        </Text>
        <Text>
          {" "}
          <span style={{ fontWeight: "bold" }}>Email :- </span> {email}{" "}
        </Text>
        <Text>
          {" "}
          <span style={{ fontWeight: "bold" }}>Location :- </span> {location}{" "}
        </Text>
        <Text>
          {" "}
          <span style={{ fontWeight: "bold" }}>Gender :- </span> {gender}{" "}
        </Text>
        <Button mt="9px" colorScheme="red" onClick={() => handleBlockUser(_id)}>
          Block
        </Button>
      </Box>
    </div>
  );
};

export default UserCard;
