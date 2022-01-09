using { cap.pass as capPass } from '../db/schema';

@path : '/passItems'
service ItemsService {
  entity passItems as projection on capPass.PassItems;
}