package views
{
   import §_-I10§.§_-e1z§;
   import §_-e1G§.§_-Hb§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §_-D1d§ extends Sprite
   {
      
      private var image:DisplayObject = null;
      
      private var §_-XW§:§_-Hb§ = null;
      
      public function §_-D1d§()
      {
         super();
         this.image = new BirthdayPieMovie();
         addChild(this.image);
         this.visible = §_-e1z§.§_-Lq§(§_-e1z§.§_-OJ§);
         this.§_-XW§ = new §_-Hb§(this,"",false,true);
         §_-e1z§.addEventListener(GameEvent.EXPIRATIONS_CHANGE,this.§_-c1Q§);
         §_-e1z§.addEventListener(GameEvent.ON_CHANGE,this.§_-Hp§);
         this.§_-Hp§(null);
      }
      
      private function §_-Hp§(param1:GameEvent) : void
      {
         this.§_-XW§.setStatus("<body><span class=\'center\'>" + gls("<b>С праздником!</b>\nИзумительный торт в честь\nДня Рождения любимой игры!\nКаждый получает угощение!\nТвоя энергия бесконечна еще:\n<b>{0}</b>",§_-e1z§.§_-7v§(§_-e1z§.§_-OJ§)) + "</span></body>");
      }
      
      private function §_-c1Q§(param1:GameEvent) : void
      {
         if(param1.data["type"] != §_-e1z§.§_-OJ§)
         {
            return;
         }
         this.visible = §_-e1z§.§_-Lq§(§_-e1z§.§_-OJ§);
      }
   }
}

