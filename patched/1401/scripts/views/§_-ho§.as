package views
{
   import §_-I10§.§_-My§;
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import tape.§_-U15§;
   import utils.§_-vo§;
   
   public class §_-ho§ extends Sprite implements §_-U15§
   {
      
      protected var §_-Qr§:§_-22V§;
      
      protected var photo:§_-s1A§;
      
      protected var §_-Gg§:§_-B1w§;
      
      protected var exp:int = -1;
      
      protected var online:Boolean = false;
      
      protected var button:DisplayObject;
      
      protected var playerId:int = -1;
      
      public function §_-ho§(param1:DisplayObject)
      {
         super();
         this.init(param1);
      }
      
      public function §_-51I§(param1:Player) : Boolean
      {
         if(this.playerId != param1.id)
         {
            return true;
         }
         if(this.exp != param1.exp)
         {
            return true;
         }
         return this.online != param1.online;
      }
      
      public function §_-q1C§(param1:Player) : void
      {
         this.photo.§_-031§(param1);
      }
      
      public function §_-031§(param1:Player) : void
      {
         this.exp = param1.exp;
         this.online = Boolean(param1.online);
         this.playerId = param1.id;
         this.§_-Gg§.§_-031§(param1);
         this.button["name"] = param1["id"];
         §_-vo§.§_-A2B§(this.§_-Qr§,§_-My§.§_-n1z§(param1["exp"]),21,true,true,param1.id);
         this.§_-Qr§.x = 45 - this.§_-Qr§.textWidth * 0.5;
      }
      
      public function §_-P2v§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(param1.target.name);
      }
      
      protected function init(param1:DisplayObject) : void
      {
         this.photo = new §_-s1A§(53);
         this.photo.x = 2;
         this.photo.y = 2;
         addChild(this.photo);
         this.button = param1;
         this.button["name"] = -1;
         addChild(this.button);
         this.button.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
         this.§_-Gg§ = new §_-B1w§();
         this.§_-Gg§.x = 45;
         this.§_-Gg§.y = 3;
         addChild(this.§_-Gg§);
         this.§_-Qr§ = new §_-22V§("",39,39,new TextFormat(§_-22V§.§_-F2z§,11,16769094,true));
         addChild(this.§_-Qr§);
      }
   }
}

