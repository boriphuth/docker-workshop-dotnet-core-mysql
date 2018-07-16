FROM microsoft/aspnetcore-build:2.0
# Can be Debug or Release.
ARG BUILD_CONFIG=Debug
ARG BUILD_LOCATION=output
ENV NUGET_XMLDOC_MODE skip

WORKDIR /app
COPY *.csproj ./
RUN dotnet restore
COPY . /app
RUN dotnet publish --output ${BUILD_LOCATION} --configuration ${BUILD_CONFIG}
