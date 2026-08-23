package §_-o1G§
{
   import §_-42B§.*;
   
   public class §_-V2p§ extends §_-J21§
   {
      
      public static const API:Number = 1;
      
      protected var §_-w2Z§:Object;
      
      protected var §_-Yy§:Boolean;
      
      public function §_-V2p§()
      {
         super();
         this.propName = "autoAlpha";
         this.overwriteProps = ["alpha","visible"];
      }
      
      override public function killProps(param1:Object) : void
      {
         super.killProps(param1);
         §_-Yy§ = Boolean("visible" in param1);
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         §_-w2Z§ = param1;
         §_-N2Z§(param1,"alpha",param1.alpha,param2,"alpha");
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         §_-FL§(param1);
         if(!§_-Yy§)
         {
            §_-w2Z§.visible = Boolean(§_-w2Z§.alpha != 0);
         }
      }
   }
}

