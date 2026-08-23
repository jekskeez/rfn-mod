package views
{
   import §_-I10§.§_-My§;
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-Z2J§ extends Sprite
   {
      
      private var §_-13L§:§_-22V§;
      
      private var photo:§_-s1A§;
      
      public function §_-Z2J§(param1:DisplayObject)
      {
         super();
         this.init(param1);
      }
      
      public function §_-031§(param1:Player) : void
      {
         this.§_-13L§.text = §_-My§.§_-n1z§(param1["exp"]);
         this.§_-13L§.x = 57 - int(this.§_-13L§.textWidth * 0.5);
         this.photo.§_-031§(param1);
      }
      
      private function init(param1:DisplayObject) : void
      {
         this.photo = new §_-s1A§(70,false);
         this.photo.x = 5;
         this.photo.y = 15;
         addChild(this.photo);
         addChild(param1);
         this.§_-13L§ = new §_-22V§("",60,60,new TextFormat(§_-22V§.§_-pJ§,14,16777215));
         addChild(this.§_-13L§);
      }
   }
}

