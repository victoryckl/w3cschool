package com.netty.server.session;

import io.netty.channel.Channel;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

public class GroupSessionMomoryImpl implements GroupSession {
    private Map<String, Group> groupMap = new ConcurrentHashMap<>();

    @Override
    public Group createGroup(String name, Set<String> members) {
        //Group group = new Group(name, members);
        //return groupMap.putIfAbsent(name, group);//如果原来key不存在，则 put(key, value)，同时返回null

        Group group = groupMap.get(name);
        if (group != null) return null;//已经存在，不允许重名，返回null

        group = new Group(name, members);
        groupMap.put(name, group);
        return group;
    }

    @Override
    public Group joinMember(String name, String member) {
//        return groupMap.computeIfPresent(name, (key, value) -> {
//            value.getMembers().add(member);
//            return value;
//        });

        Group group = groupMap.get(name);
        if (group == null) return null;
        group.addMember(member);
        return group;
    }

    @Override
    public Group removeMember(String name, String member) {
//        return groupMap.computeIfPresent(name, (key, value) -> {
//            value.getMembers().remove(member);
//            return value;
//        });

        Group group = groupMap.get(name);
        if (group == null) return null;
        group.removeMember(member);
        return group;
    }

    @Override
    public Group removeGroup(String name) {
        return groupMap.remove(name);
    }

    @Override
    public Set<String> getMembers(String name) {
        return groupMap.getOrDefault(name, Group.EMPTY_GROUP).getMembers();
    }

    @Override
    public List<Channel> getMembersChannel(String name) {
        return getMembers(name).stream()
                .map(member -> SessionFactory.getSession().getChannel(member))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }
}
