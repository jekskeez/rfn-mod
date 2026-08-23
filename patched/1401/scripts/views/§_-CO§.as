package views
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class §_-CO§ extends Sprite
   {
      
      public static const §_-82P§:int = 0;
      
      public static const §_-W13§:int = 1;
      
      public static const §_-J1t§:int = 2;
      
      public static const §_-X2u§:int = 3;
      
      private static const §_-s1F§:Number = 90;
      
      private static const §_-51R§:Number = 100;
      
      private var background:MovieClip = null;
      
      private var §_-t1S§:MovieClip = null;
      
      private var §_-W1k§:MovieClip = null;
      
      private var field:§_-22V§;
      
      private var §_-W2T§:int = 0;
      
      public var §_-F1M§:Number = 0;
      
      public var §_-BB§:Number = 0;
      
      public function §_-CO§(param1:int = 12)
      {
         super();
         var _loc2_:TextFormat = new TextFormat(null,param1,1784680,true);
         _loc2_.align = TextFormatAlign.CENTER;
         this.background = new EducationCloud();
         addChild(this.background);
         this.§_-t1S§ = new LearningShamanImage();
         this.§_-t1S§.y = -30;
         addChild(this.§_-t1S§);
         this.field = new §_-22V§("",§_-s1F§,25,_loc2_);
         addChild(this.field);
         this.§_-W1k§ = new CloudArrow();
         this.§_-W1k§.x = §_-51R§;
         addChild(this.§_-W1k§);
      }
      
      public function set text(param1:String) : void
      {
         this.field.text = param1;
         this.update();
      }
      
      public function set §_-O1s§(param1:int) : void
      {
         this.§_-W2T§ = param1;
         this.update();
      }
      
      public function update() : void
      {
         this.background.width = Math.floor(this.field.width + §_-s1F§) + 40;
         this.background.height = Math.floor(this.field.height) + 50;
         this.§_-W1k§.scaleX = this.§_-W2T§ == §_-W13§ || this.§_-W2T§ == §_-X2u§ ? -1 : 1;
         this.§_-W1k§.scaleY = this.§_-W2T§ >= §_-J1t§ ? -1 : 1;
         this.§_-W1k§.x = (this.§_-W2T§ == §_-W13§ || this.§_-W2T§ == §_-X2u§ ? this.background.width - §_-51R§ : §_-51R§) + this.§_-F1M§;
         this.§_-W1k§.y = (this.§_-W2T§ >= §_-J1t§ ? 0 : this.background.height) + this.§_-BB§;
      }
   }
}

