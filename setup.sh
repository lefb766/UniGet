#! /bin/sh

UNIGET_ROOT="$(dirname $0)"

nuget_dir="$UNIGET_ROOT/.nuget"
[ ! -d "$nuget_dir" ] && mkdir "$nuget_dir"

if [ ! -e "$nuget_dir/NuGet.exe" ]; then
    url='https://nuget.org/nuget.exe'
    target="$UNIGET_ROOT/.nuget/NuGet.exe"
    if command -v wget > /dev/null; then
        wget "$url" -O "$target"
    else
        curl -L "$url" > "$target"
    fi
fi

config_dir="$UNIGET_ROOT/config"
[ ! -d "$config_dir" ] && mkdir "$config_dir"

[ ! -e "$config_dir/sources" ] &&
echo "https://www.nuget.org/api/v2" > $config_dir/sources

