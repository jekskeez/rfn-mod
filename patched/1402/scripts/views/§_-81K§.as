package views
{
   import §_-X1k§.§_-XW§;
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import menu.§_-cD§;
   import tape.§_-I2Z§;
   import utils.§_-L2J§;
   
   public class §_-81K§ extends Sprite implements §_-I2Z§
   {
      
      protected var §_-D2w§:§_-i5§;
      
      protected var photo:§_-V2O§;
      
      protected var §_-118§:§_-z§;
      
      protected var exp:int = -1;
      
      protected var online:Boolean = false;
      
      protected var button:DisplayObject;
      
      protected var playerId:int = -1;
      
      public function §_-81K§(param1:DisplayObject)
      {
         super();
         this.init(param1);
      }
      
      public function §_-o2c§(param1:Player) : Boolean
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
      
      public function §_-63H§(param1:Player) : void
      {
         this.photo.§_-yC§(param1);
      }
      
      public function §_-yC§(param1:Player) : void
      {
         this.exp = param1.exp;
         this.online = Boolean(param1.online);
         this.playerId = param1.id;
         this.§_-118§.§_-yC§(param1);
         this.button["name"] = param1["id"];
         §_-L2J§.§_-CS§(this.§_-D2w§,§_-XW§.§_-Wh§(param1["exp"]),21,true,true,param1.id);
         this.§_-D2w§.x = 45 - this.§_-D2w§.textWidth * 0.5;
      }
      
      public function §_-H1h§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(param1.target.name);
      }
      
      protected function init(param1:DisplayObject) : void
      {
         this.photo = new §_-V2O§(53);
         this.photo.x = 2;
         this.photo.y = 2;
         addChild(this.photo);
         this.button = param1;
         this.button["name"] = -1;
         addChild(this.button);
         this.button.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
         this.§_-118§ = new §_-z§();
         this.§_-118§.x = 45;
         this.§_-118§.y = 3;
         addChild(this.§_-118§);
         this.§_-D2w§ = new §_-i5§("",39,39,new TextFormat(§_-i5§.§_-c10§,11,16769094,true));
         addChild(this.§_-D2w§);
      }
   }
}

