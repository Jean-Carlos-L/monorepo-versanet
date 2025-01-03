import { useState } from "react";
import FormUser from "./components/FormUser";
import { UserCreate } from "@/common/models/User";
import { useUsersCommand } from "./hooks/useUsersCommand";
import Header from "@/common/components/Header";

function UsersCreate() {
  const [user, setUser] = useState<UserCreate>({
    name: "",
    email: "",
    password: "",
    confirmPassword: "",
    status: 1,
  });

  const { createUser, loadingAction } = useUsersCommand();

  const handleChange = (user: UserCreate) => {
    setUser(user);
  };

  const handleSubmit = async () => {
    await createUser(user).then(() => {
      setUser({
        name: "",
        email: "",
        password: "",
        confirmPassword: "",
        status: 1,
        role: "",
      });
    });
  };

  return (
    <main>
      <Header title="Crear usuario" />

      <FormUser
        user={user}
        loading={loadingAction}
        onSubmit={handleSubmit}
        onChange={handleChange}
      />
    </main>
  );
}

export default UsersCreate;
