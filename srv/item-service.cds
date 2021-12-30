using { cap.pass as capPass } from '../db/schema';
service AdminService @(_requires:'authenticated-user') {
  entity Items as projection on capPass.Items;
}