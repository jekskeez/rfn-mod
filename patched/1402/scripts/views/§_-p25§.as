package views
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-ku§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §_-p25§ extends Sprite
   {
      
      private var image:DisplayObject = null;
      
      private var §_-oj§:§_-kr§ = null;
      
      public function §_-p25§()
      {
         super();
         this.image = new BirthdayPieMovie();
         addChild(this.image);
         this.visible = §_-ku§.§_-R1C§(§_-ku§.§_-Z2J§);
         this.§_-oj§ = new §_-kr§(this,"",false,true);
         §_-ku§.addEventListener(GameEvent.EXPIRATIONS_CHANGE,this.§_-91E§);
         §_-ku§.addEventListener(GameEvent.ON_CHANGE,this.§_-w1T§);
         this.§_-w1T§(null);
      }
      
      private function §_-w1T§(param1:GameEvent) : void
      {
         this.§_-oj§.setStatus("<body><span class=\'center\'>" + gls("<b>С праздником!</b>\nИзумительный торт в честь\nДня Рождения любимой игры!\nКаждый получает угощение!\nТвоя энергия бесконечна еще:\n<b>{0}</b>",§_-ku§.§_-g2V§(§_-ku§.§_-Z2J§)) + "</span></body>");
      }
      
      private function §_-91E§(param1:GameEvent) : void
      {
         if(param1.data["type"] != §_-ku§.§_-Z2J§)
         {
            return;
         }
         this.visible = §_-ku§.§_-R1C§(§_-ku§.§_-Z2J§);
      }
   }
}

