FROM golang:1.27.2 AS build

WORKDIR /src

COPY . .

RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o /out/hotaru-api .

FROM gcr.io/distroless/static-debian13:nonroot

COPY --from=build /out/hotaru-api /hotaru-api

USER nonroot:nonroot

EXPOSE 8080

ENTRYPOINT ["/hotaru-api"]
