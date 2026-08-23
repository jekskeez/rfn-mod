package buttons
{
   import flash.text.TextFormat;
   import views.§_-km§;
   
   public class §_-R1p§ extends §_-uH§
   {
      
      public var §_-11b§:§_-km§;
      
      private var field:§_-i5§;
      
      public function §_-R1p§(param1:String)
      {
         super(new ButtonAwardBack());
         var _loc2_:§_-i5§ = new §_-i5§(param1,0,5,new TextFormat(§_-i5§.§_-p1s§,16,8746579));
         _loc2_.x = 100 - int(_loc2_.textWidth * 0.5);
         addChild(_loc2_);
         this.§_-11b§ = new §_-km§([{
            "image":new AwardTypeBack(),
            "X":0,
            "Y":0
         },{
            "image":new AwardTypeActive(),
            "X":0,
            "Y":0
         },{
            "image":new AwardTypeActive(),
            "X":0,
            "Y":0
         }],170);
         this.§_-11b§.§_-T1n§(new AwardTypeBack());
         this.§_-11b§.x = 15;
         this.§_-11b§.y = 30;
         this.§_-11b§.mouseEnabled = false;
         addChild(this.§_-11b§);
         this.field = new §_-i5§("",0,28,new TextFormat(null,16,16777215,true));
         addChild(this.field);
      }
      
      public function §_-d1Z§(param1:int, param2:int) : void
      {
         this.§_-11b§.§_-d1Z§(param1,param2);
         this.field.text = param1 + "/" + param2;
         this.field.x = 100 - int(this.field.textWidth * 0.5);
      }
      
      override protected function §_-5U§() : void
      {
         super.§_-5U§();
         if(this.§_-11b§ != null)
         {
            this.§_-11b§.§_-n2d§(false);
         }
      }
      
      override protected function §_-f17§() : void
      {
         super.§_-f17§();
         if(this.§_-11b§ != null)
         {
            this.§_-11b§.§_-n2d§(true);
         }
      }
   }
}

