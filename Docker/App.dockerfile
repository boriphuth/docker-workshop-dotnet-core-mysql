FROM microsoft/aspnetcore:2.0.0
ARG PORT
WORKDIR /app
ENV NUGET_XMLDOC_MODE skip
ENV ASPNETCORE_URLS http://*:${PORT}
COPY ./output/ ./
ENTRYPOINT [ "dotnet", "ContainerProd.dll" ]
