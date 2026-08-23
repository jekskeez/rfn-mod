package views
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class §_-j2q§ extends Sprite
   {
      
      public static const §_-E2g§:int = 0;
      
      public static const §_-e1g§:int = 1;
      
      public static const §_-j2m§:int = 2;
      
      public static const §_-71x§:int = 3;
      
      private static const §_-p1t§:Number = 90;
      
      private static const §_-jq§:Number = 100;
      
      private var background:MovieClip = null;
      
      private var §_-w15§:MovieClip = null;
      
      private var §_-h2K§:MovieClip = null;
      
      private var field:§_-i5§;
      
      private var §_-43o§:int = 0;
      
      public var §_-I2D§:Number = 0;
      
      public var §_-XD§:Number = 0;
      
      public function §_-j2q§(param1:int = 12)
      {
         super();
         var _loc2_:TextFormat = new TextFormat(null,param1,1784680,true);
         _loc2_.align = TextFormatAlign.CENTER;
         this.background = new EducationCloud();
         addChild(this.background);
         this.§_-w15§ = new LearningShamanImage();
         this.§_-w15§.y = -30;
         addChild(this.§_-w15§);
         this.field = new §_-i5§("",§_-p1t§,25,_loc2_);
         addChild(this.field);
         this.§_-h2K§ = new CloudArrow();
         this.§_-h2K§.x = §_-jq§;
         addChild(this.§_-h2K§);
      }
      
      public function set text(param1:String) : void
      {
         this.field.text = param1;
         this.update();
      }
      
      public function set §_-J28§(param1:int) : void
      {
         this.§_-43o§ = param1;
         this.update();
      }
      
      public function update() : void
      {
         this.background.width = Math.floor(this.field.width + §_-p1t§) + 40;
         this.background.height = Math.floor(this.field.height) + 50;
         this.§_-h2K§.scaleX = this.§_-43o§ == §_-e1g§ || this.§_-43o§ == §_-71x§ ? -1 : 1;
         this.§_-h2K§.scaleY = this.§_-43o§ >= §_-j2m§ ? -1 : 1;
         this.§_-h2K§.x = (this.§_-43o§ == §_-e1g§ || this.§_-43o§ == §_-71x§ ? this.background.width - §_-jq§ : §_-jq§) + this.§_-I2D§;
         this.§_-h2K§.y = (this.§_-43o§ >= §_-j2m§ ? 0 : this.background.height) + this.§_-XD§;
      }
   }
}

