// Deno.serve(async (req) => {
//   try {
//     const { vin } = await req.json()

//     const response = await fetch(
//       `https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVin/${vin}?format=json`
//     )

//     const data = await response.json()

//     const results = data.Results

//     const make =
//       results.find(
//         (e: any) => e.Variable === "Make"
//       )?.Value //|| ""

//     const model =
//       results.find(
//         (e: any) => e.Variable === "Model"
//       )?.Value //|| ""

//     const year =
//       results.find(
//         (e: any) =>
//           e.Variable === "Model Year"
//       )?.Value || "0"

//     return new Response(
//       JSON.stringify({
//         vin,
//         make,
//         model,
//         year: Number(year),
//       }),
//       {
//         headers: {
//           "Content-Type": "application/json",
//         },
//       }
//     )
//   } catch (e) {
//     return new Response(
//       JSON.stringify({
//         error: String(e),
//       }),
//       {
//         status: 500,
//       }
//     )
//   }
// })