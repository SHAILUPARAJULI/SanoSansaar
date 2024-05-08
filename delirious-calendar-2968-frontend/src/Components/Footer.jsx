import React from "react";
import {
  Box,
  Container,
  Stack,
  Text,
  chakra,
  useColorModeValue,
  VisuallyHidden, // Import VisuallyHidden
} from "@chakra-ui/react";
import "./Footer.css"; // Import CSS file

import {
  FaTwitter,
  FaYoutube,
  FaInstagram,
  FaLinkedin,
  FaFacebook,
} from "react-icons/fa";

const ListHeader = ({ children }) => {
  return (
    <Text fontWeight={"500"} fontSize={"lg"} mb={2}>
      {children}
    </Text>
  );
};

const SocialButton = ({ children, label, href }) => {
  return (
    <chakra.button
      className="social-button" // Apply CSS class
      as={"a"}
      href={href}
      display={"inline-flex"}
      alignItems={"center"}
      justifyContent={"center"}
    >
      <VisuallyHidden>{label}</VisuallyHidden> {/* Use VisuallyHidden */}
      {children}
    </chakra.button>
  );
};

const Footer = () => {
  return (
    <Box className="footer">
      <Box className="footer-container">
        <Container
          as={Stack}
          maxW={"6xl"}
          py={4}
          direction={{ base: "column", md: "row" }}
          spacing={4}
          justify={{ md: "space-between" }}
          align={{ md: "center" }}
        >
          <Text>©2023 SanoSansaar All trademarks are owned by Sanosansaar</Text>
          <Stack direction={"row"} spacing={6}>
            <SocialButton label={"Facebook"} href={"#"}>
              <FaFacebook />
            </SocialButton>
            <SocialButton label={"Twitter"} href={"#"}>
              <FaTwitter />
            </SocialButton>
            <SocialButton label={"YouTube"} href={"#"}>
              <FaYoutube />
            </SocialButton>
            <SocialButton label={"Instagram"} href={"#"}>
              <FaInstagram />
            </SocialButton>
            <SocialButton label={"Linkedin"} href={"#"}>
              <FaLinkedin />
            </SocialButton>
          </Stack>
        </Container>
      </Box>
    </Box>
  );
};

export default Footer;
