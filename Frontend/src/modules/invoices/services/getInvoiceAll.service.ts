import { FetchData } from "@/common/hooks/useFetch";
import { FiltersInvoice } from "../hooks/useFilters";
import { InvoiceAdapter } from "../adapters/invoice.adapter";
import { Invoice } from "@/common/models/Invoice";

export const getInvoiceAllService =
  (fetch: FetchData) =>
  async (filters: FiltersInvoice): Promise<Invoice[]> => {
    try {
      const searchParams = new URLSearchParams(
        Object.entries(filters)
      ).toString();
      interface Response {
        data: Invoice[];
        message: string;
      }

      const response = await fetch<void, Response>({
        url: `/api/invoices?${searchParams}`,
        method: "get",
      });

      return response.data.data.map(InvoiceAdapter);
    } catch (error) {
      console.error("Error al obtener las facturas:", error);
      throw new Error(
        error.response?.data?.message ||
          "Ocurrió un error al obtener las facturas"
      );
    }
  };
