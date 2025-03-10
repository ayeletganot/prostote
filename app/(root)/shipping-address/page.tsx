import { auth } from "@/auth";
import { getMyCart } from "@/lib/actions/cart.action";
import { getUserById } from "@/lib/actions/user.action";
import { ShippingAddress } from "@/types";
import { Metadata } from "next";
import { redirect } from "next/navigation";
import ShippingAddressForm from "./shipping-address-form";

export const metadata: Metadata = {
  title: "Shipping adress",
};

const ShippingAdressPage = async () => {
  const cart = await getMyCart();
  if (!cart || cart.items.length === 0) redirect("/cart");

  const session = await auth();
  console.log("session" + session);
  const userId = session?.user?.id;

  if (!userId) throw new Error("User id not found");
  const user = await getUserById(userId);

  return <ShippingAddressForm address={user.address as ShippingAddress} />;
};

export default ShippingAdressPage;
