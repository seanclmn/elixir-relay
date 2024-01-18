import React from "react";
import { useLazyLoadQuery } from "react-relay";
import { graphql } from "relay-runtime";
import { AppUsersQuery } from "../../__generated__/AppUsersQuery.graphql";
import { ErrorBoundary } from "../shared/ErrorBoundary";

const query = graphql`
  query UsersQuery {
    allUsers {
      firstname
      lastname
      email
      id
    }
  }
`;

export const Users = (): React.ReactElement | null => {
  const [loading, setLoading] = React.useState(false);
  const { allUsers } = useLazyLoadQuery<AppUsersQuery>(query, {});

  return (
    <ErrorBoundary>
      {allUsers.map((user) => (
        <div key={user.id}>
          <p>{user.firstname}</p>
          <p>{user.lastname}</p>
        </div>
      ))}
    </ErrorBoundary>
  );
};
