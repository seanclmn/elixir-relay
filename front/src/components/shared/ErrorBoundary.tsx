import { Spinner } from "@chakra-ui/react";
import { ReactElement, ReactNode, Suspense } from "react";

interface ErrorBoundaryProps {
  children: ReactNode | ReactNode[];
}

export const ErrorBoundary = ({
  children,
}: ErrorBoundaryProps): ReactElement => {
  return (
    <Suspense
      fallback={
        <Spinner
          thickness="4px"
          speed="0.65s"
          emptyColor="gray.200"
          color="blue.500"
          size="xl"
        />
      }
    >
      {children}
    </Suspense>
  );
};
