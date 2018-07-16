FROM microsoft/aspnetcore-build:2.0 as step1
# Can be Debug or Release.
ARG BUILD_CONFIG=Debug
ARG BUILD_LOCATION=/app/output
ENV NUGET_XMLDOC_MODE skip

WORKDIR /app
COPY *.csproj ./
RUN dotnet restore
COPY . /app
RUN dotnet publish --output ${BUILD_LOCATION} --configuration ${BUILD_CONFIG}

FROM microsoft/aspnetcore:2.0.0
ARG PORT
WORKDIR /app
ENV NUGET_XMLDOC_MODE skip
COPY --from=step1 /app/output/ ./
ENTRYPOINT [ "dotnet", "ContainerProd.dll" ]
